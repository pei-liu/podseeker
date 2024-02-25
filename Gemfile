source "https://rubygems.org"

ruby "3.3.0"
gem "rails", "~> 7.1.3"
gem "pg", "~> 1.1"
gem "puma", ">= 5.0"
gem "bootsnap", require: false
gem "rss"
# see https://pganalyze.com/blog/full-text-search-ruby-rails-postgres for more on pg_search
gem 'pg_search', '~> 2.3', '>= 2.3.2'

group :development, :test do
  gem "pry"
end

group :development do
  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end

