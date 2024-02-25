# frozen_string_literal: true

class EpisodesController < ApplicationController
  def search
    search_term = params[:q]
    episodes = Episode.includes(:podcast).search_episode(search_term).limit(50).map do |e|
      pc = e.podcast
      {
        podcast_title: pc.title,
        podcast_image_url: pc.image_url,
        episode_title: e.title,
        episode_author: e.author,
        episode_description: e.description,
        episode_url: e.content_as_json["link"],
        episode_publish_date: e.content_as_json["pubDate"]
      }
    end

    render json: episodes
  end
end
