class CreateEpisodes < ActiveRecord::Migration[6.0]
  def change
    create_table :episodes do |t|
      t.belongs_to :podcast, foreign_key: true
      t.string :guid, null: false
      t.string :title, null: false
      t.string :author
      t.string :description_raw
      t.string :description
      t.jsonb :content_as_json, null: false

      t.timestamps
    end

    add_index :episodes, [:podcast_id, :guid], unique: true
  end
end
