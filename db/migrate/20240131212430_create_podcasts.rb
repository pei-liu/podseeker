class CreatePodcasts < ActiveRecord::Migration[6.0]
  def change
    create_table :podcasts do |t|
      t.string :title, null: false
      t.string :rss_url, null: false
      t.string :description
      t.string :image_url
      t.datetime :last_build_date
      t.datetime :last_fetch_time

      t.timestamps
    end
  end
end
