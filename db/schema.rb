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

ActiveRecord::Schema.define(version: 2019_01_08_101143) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.string "name"
    t.string "price"
    t.boolean "love_tag"
    t.bigint "step_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["step_id"], name: "index_activities_on_step_id"
  end

  create_table "bars", force: :cascade do |t|
    t.string "name"
    t.string "price"
    t.boolean "love_tag"
    t.bigint "step_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "address"
    t.float "latitude"
    t.float "longitude"
    t.index ["step_id"], name: "index_bars_on_step_id"
  end

  create_table "hotels", force: :cascade do |t|
    t.string "name"
    t.string "price"
    t.boolean "love_tag"
    t.bigint "step_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "address"
    t.float "latitude"
    t.float "longitude"
    t.integer "rating"
    t.index ["step_id"], name: "index_hotels_on_step_id"
  end

  create_table "pg_search_documents", force: :cascade do |t|
    t.text "content"
    t.string "searchable_type"
    t.bigint "searchable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["searchable_type", "searchable_id"], name: "index_pg_search_documents_on_searchable_type_and_searchable_id"
  end

  create_table "relationships", force: :cascade do |t|
    t.integer "follower_id"
    t.integer "followed_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["followed_id"], name: "index_relationships_on_followed_id"
    t.index ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true
    t.index ["follower_id"], name: "index_relationships_on_follower_id"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "name"
    t.string "price"
    t.boolean "love_tag"
    t.bigint "step_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "address"
    t.float "latitude"
    t.float "longitude"
    t.index ["step_id"], name: "index_restaurants_on_step_id"
  end

  create_table "steps", force: :cascade do |t|
    t.bigint "trip_id"
    t.string "place"
    t.date "date_begin"
    t.date "date_end"
    t.string "hotel"
    t.integer "hotel_price"
    t.text "comment"
    t.string "love_tag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "address"
    t.float "latitude"
    t.float "longitude"
    t.string "photo"
    t.integer "night"
    t.index ["trip_id"], name: "index_steps_on_trip_id"
  end

  create_table "tips", force: :cascade do |t|
    t.string "tip"
    t.bigint "trip_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trip_id"], name: "index_tips_on_trip_id"
  end

  create_table "trips", force: :cascade do |t|
    t.string "title"
    t.date "date_begin"
    t.date "date_end"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.string "photo"
    t.integer "number_steps", default: 0
    t.string "address"
    t.float "latitude"
    t.float "longitude"
    t.date "date"
    t.boolean "only_step"
    t.index ["user_id"], name: "index_trips_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo"
    t.string "name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "activities", "steps"
  add_foreign_key "bars", "steps"
  add_foreign_key "hotels", "steps"
  add_foreign_key "restaurants", "steps"
  add_foreign_key "steps", "trips"
  add_foreign_key "tips", "trips"
  add_foreign_key "trips", "users"
end
