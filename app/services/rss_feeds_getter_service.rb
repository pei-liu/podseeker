require 'rss'
require 'open-uri'

class RssFeedsGetterService
  MIN_HOURS_BEFORE_LAST_FETCH = 12
  def initialize
  end

  def run(podcast, force: false)
    puts '-' * 50
    puts "Starting RSS Feed refresh for podcast:"
    puts "ID: #{podcast.id}"
    puts "Title: #{podcast.title}"

    if force
      puts "`force` arg set to true. Script will bypass staleeness logic and refresh all records."
    end

    URI.open(podcast.rss_url) do |rss|
      feed = RSS::Parser.parse(rss, validate: false)
      channel = feed.channel

      unless force
        # Do not fetch if RSS feed has not been updated
        next if podcast.last_build_date.present? && (podcast.last_build_date >= channel.lastBuildDate)

        # Do not fetch if we've recently fetched
        if podcast.last_fetch_time
          seconds_since_last_fetch = Time.now - podcast.last_fetch_time
          next if seconds_since_last_fetch < (60 * 60 * MIN_HOURS_BEFORE_LAST_FETCH)
        end
      end

      podcast.update!({
        title: channel.title,
        description: channel.description,
        last_build_date: channel.lastBuildDate,
        last_fetch_time: Time.now,
        image_url: channel.image.url
      })

      insert_new_episodes(feed, podcast)
    end
  end

  private

  def insert_new_episodes(feed, podcast)
    existing_ep_guids = podcast.episodes.pluck(:guid)

    skip_count = 0
    insert_count = 0

    feed.items.each do |item|
      guid = item.guid.content
      if existing_ep_guids.include?(guid)
        skip_count += 1
        next
      end

      # TO DO: do bulk insert instead
      Episode.create!({
        podcast: podcast,
        guid: guid,
        title: item.title,
        author: item.author,
        description_raw: item.description,
        content_as_json: item.as_json
      })
      insert_count += 1
    end

    puts "#{insert_count} eps inserted. #{skip_count} eps skipped b/c guid already exists."
  end
end
