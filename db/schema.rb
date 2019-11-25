# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_11_25_160826) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bars", force: :cascade do |t|
    t.bigint "user_id"
    t.string "name"
    t.string "address"
    t.float "longitude"
    t.float "latitude"
    t.string "image"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_bars_on_user_id"
  end

  create_table "likes", force: :cascade do |t|
    t.bigint "song_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["song_id"], name: "index_likes_on_song_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "playlists", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "song_id"
    t.datetime "started_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["song_id"], name: "index_playlists_on_song_id"
    t.index ["user_id"], name: "index_playlists_on_user_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.bigint "bar_id"
    t.text "description"
    t.bigint "playlist_id"
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bar_id"], name: "index_sessions_on_bar_id"
    t.index ["playlist_id"], name: "index_sessions_on_playlist_id"
  end

  create_table "songs", force: :cascade do |t|
    t.string "artist"
    t.string "album"
    t.string "category"
    t.float "duration"
    t.string "title"
    t.bigint "deezer_id"
    t.string "composer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.string "genre"
    t.string "photo"
    t.boolean "barman"
    t.integer "birthyear"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bars", "users"
  add_foreign_key "likes", "songs"
  add_foreign_key "likes", "users"
  add_foreign_key "playlists", "songs"
  add_foreign_key "playlists", "users"
  add_foreign_key "sessions", "bars"
  add_foreign_key "sessions", "playlists"
end
