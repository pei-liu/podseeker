# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_02_02_223609) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "episodes", force: :cascade do |t|
    t.bigint "podcast_id"
    t.string "guid", null: false
    t.string "title", null: false
    t.string "author"
    t.string "description_raw"
    t.string "description"
    t.jsonb "content_as_json", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.virtual "searchable", type: :tsvector, as: "(setweight(to_tsvector('english'::regconfig, (COALESCE(title, ''::character varying))::text), 'A'::\"char\") || setweight(to_tsvector('english'::regconfig, (COALESCE(description, ''::character varying))::text), 'B'::\"char\"))", stored: true
    t.index ["podcast_id", "guid"], name: "index_episodes_on_podcast_id_and_guid", unique: true
    t.index ["podcast_id"], name: "index_episodes_on_podcast_id"
    t.index ["searchable"], name: "index_episodes_on_searchable", using: :gin
  end

  create_table "podcasts", force: :cascade do |t|
    t.string "title", null: false
    t.string "rss_url", null: false
    t.string "description"
    t.string "image_url"
    t.datetime "last_build_date", precision: nil
    t.datetime "last_fetch_time", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "episodes", "podcasts"
end
