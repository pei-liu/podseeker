class DataFormatterService
  def run
    episodes = Episode.where(description: nil)

    puts "Adding description and inverted index to #{episodes.count} episodes..."

    episodes.each do |episode|
      d = ActionController::Base.helpers.strip_tags(episode.description_raw)

      # updating the `description` column will also trigger the `searchable` tsvector column to update
      # See https://pganalyze.com/blog/full-text-search-ruby-rails-postgres
      episode.update(description: d)
    end

    puts "Description formatting complete."
  end
end
