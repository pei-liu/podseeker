# frozen_string_literal: true

class HealthCheckController < ApplicationController
  def index
    Podcast.first!
    render(json: { time: Time.now.utc })
  end
end
