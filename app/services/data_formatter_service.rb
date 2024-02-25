class DataFormatterService
  def run
    Episode.where(description: nil).each do |episode|
      d = ActionController::Base.helpers.strip_tags(episode.description_raw)

      # updating the `description` column will also trigger the `searchable` tsvector column to update
      # See https://pganalyze.com/blog/full-text-search-ruby-rails-postgres
      episode.update(description: d)
    end
  end
end
