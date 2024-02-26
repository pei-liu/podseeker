namespace :rss do
  desc "Fetch latest podcast episodes via from RSS feeds"
  task :fetch_latest_episodes, [:force] => :environment do |_t, args|
    args.with_defaults(:force => 'f')
    force = ['t', 'true'].include? args[:force]
    Podcast.all.each { |p| ScrapeRssFeedJob.perform_now(p.id, force) }
  end

  task :async_fetch_latest_episodes, [:force] => :environment do |_t, args|
    args.with_defaults(:force => 'f')
    force = ['t', 'true'].include? args[:force]
    Podcast.all.each { |p| ScrapeRssFeedJob.perform_later(p.id, force) }
  end
end
