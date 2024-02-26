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
  ["SmartLess", "https://rss.art19.com/smartless"],
  ["Fresh Air", "https://feeds.npr.org/381444908/podcast.xml"],
  ["The Joe Rogan Experience", "https://anchor.fm/s/308e8de0/podcast/rss"],
  ["Crime Junkie", "https://feeds.simplecast.com/qm_9xx0g"],
  ["NerdWallet's Smart Money Podcast", "https://feeds.megaphone.fm/NRD5253082283"],
  ["Stuff You Should Know", "https://www.omnycontent.com/d/playlist/e73c998e-6e60-432f-8610-ae210140c5b1/a91018a4-ea4f-4130-bf55-ae270180c327/44710ecc-10bb-48d1-93c7-ae270180c33e/podcast.rss"],
  ["Significant Others", "https://feeds.simplecast.com/U1oFUzZu"],
  ["This American Life", "https://www.thisamericanlife.org/podcast/rss.xml"],
  ["The Ezra Klein Show", "https://feeds.simplecast.com/82FI35Px"],
  ["Freakonomics", "https://feeds.simplecast.com/Y8lFbOT4"],
  ["Criminal", "https://feeds.megaphone.fm/VMP7924981569"],
  ["99% Invisible", "https://feeds.simplecast.com/jn7O6Fnt"],
  ["Planet Money", "https://feeds.npr.org/510289/podcast.xml"],
  ["Serial", "https://feeds.simplecast.com/xl36XBC2"],
  ["Call Her Daddy", "https://feeds.megaphone.fm/GLT3714323852"],
].each do |podcast|
  Podcast.find_or_create_by!(title: podcast[0], rss_url: podcast[1])
end
