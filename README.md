# README

## Project Description
As a podcast consumer, I subscribe to podcasts that I listen to on a regular basis. However, sometimes I desire to search for individual podcast *episodes*, based on a keyword, regardless of whether that episode is from a podcast I'm subscribed to. This way I can better discover new podcasts that are about things I'm interested in. The system I'm designing will first fetch podcast metadata from public RSS feeds (almost all podcasts have one because it is required to get onto apps such as Apple Podcasts) and parse each episodes' metadata (title, description, transcript). Second, it will analyze this data to create an inverted index for searching. Finally, there will be a search engine UI where the user can enter a keyword and see a list of recent podcast episodes (across different podcast series) related to that keyword. This product is unique because while there are many sites that allow you
to find podcast series by topic, I couldn't find anything that allows you find episodes by topic.

*Constraints*:

For v1, we will have a fixed list of the most popular podcasts we fetch data for. But in future iterations, you can imagine a larger list or the user being able to enter their own RSS feed.

## About
* This app requires the following to be installed to run locally:
    * Ruby
    * Ruby on Rails
    * Node
    * Postgresql

## Setup
1. Install gem dependencies: `bundle install`
2. Setup/migrate/seed db: `rails db:setup`
3. Run `rake start` to start both the Rails API and React frontend. Alternatively, you can run `PORT=3001 bundle exec rails s` and `PORT=3000 yarn --cwd frontend start` in separate terminal windows which is necessary to create debug breakpoints in Rails.
## Run Test Suite
TO DO

## System Components
### Podcast getter service
The `RssFeedsGetterService` iterates through all RSS feed urls (stored in the `podcasts` table) and fetches the latest raw
XML for each podcast feed. The data is parsed and saved to the `episodes` table.

Invoke with the rake task: `rake rss:fetch_latest_episodes`

Can also pass in 't' to bypass logic that checks if the data has been recently fetched before executing a new fetch: `rake rss:fetch_latest_episodes[t]`


## Data Formatter Service
The `DataFormatterService` will iterate through yet-to-be-formatted episodes and 1) Strip out HTML elements from the
XML and save the formatted text to the `episodes.description` column  2) Analyze the description text and and create an
inverted index (saved to `episodes.searchable`) that powers the search engine functionality.

Invoke with the rake task: `rake data:transform_episode_description`
