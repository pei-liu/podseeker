class Episode < ApplicationRecord
  # see https://pganalyze.com/blog/full-text-search-ruby-rails-postgres for more on pg_search
  include PgSearch::Model
  pg_search_scope :search_episode,
                  against: { title: 'A', description: 'B' },
                  using: {
                    tsearch: {
                      dictionary: 'english', tsvector_column: 'searchable'
                    }
                  }

  belongs_to :podcast

  validates_presence_of :guid, :title, :content_as_json
end
