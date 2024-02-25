namespace :rss do
  desc "Fetch latest podcast episodes via from RSS feeds"
  task :fetch_latest_episodes, [:force] => :environment do |_t, args|
    args.with_defaults(:force => 'f')
    force = ['t', 'true'].include? args[:force]
    RssFeedsGetterService.new.run(force: force)
  end
end
