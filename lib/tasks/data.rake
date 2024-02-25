namespace :data do
  desc "Format episode description and create inverted index for search"
  task transform_episode_description: :environment do
    DataFormatterService.new.run
  end
end
