# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

[
  ["The Daily", "http://rss.art19.com/the-daily"],
  ["Dateline NBC", "https://podcastfeeds.nbcnews.com/dateline-nbc"],
  ["SmartLess", "https://rss.art19.com/smartless"]
].each do |podcast|
  Podcast.find_or_create_by!(title: podcast[0], rss_url: podcast[1])
end
