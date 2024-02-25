class Podcast < ApplicationRecord
  has_many :episodes, dependent: :destroy

  validates_presence_of :title, :rss_url
end
