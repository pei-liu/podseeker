class ScrapeRssFeedJob < ApplicationJob
  queue_as :default

  def perform(podcast_id, force = false)
    podcast = Podcast.find(podcast_id)
    RssFeedsGetterService.new.run(podcast, force: force)
  end
end
