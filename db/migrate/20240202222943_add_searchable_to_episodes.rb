class AddSearchableToEpisodes < ActiveRecord::Migration[6.0]
  def up
    # Creates a column named `searchable` for the pg-search gem to do full text searches
    # See https://pganalyze.com/blog/full-text-search-ruby-rails-postgres
    execute <<-SQL
      ALTER TABLE episodes
      ADD COLUMN searchable tsvector GENERATED ALWAYS AS (
        setweight(to_tsvector('english', coalesce(title, '')), 'A') ||
        setweight(to_tsvector('english', coalesce(description,'')), 'B')
      ) STORED;
    SQL
  end

  def down
    remove_column :episodes, :searchable
  end
end
