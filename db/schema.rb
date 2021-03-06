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

ActiveRecord::Schema.define(version: 2021_12_01_220037) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "hikes", force: :cascade do |t|
    t.string "name"
    t.integer "mileage"
    t.integer "elevation_gain"
    t.boolean "water_on_route"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "park_id"
    t.index ["park_id"], name: "index_hikes_on_park_id"
  end

  create_table "mountains", force: :cascade do |t|
    t.string "name"
    t.integer "elevation"
    t.boolean "safe_winter_route"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "mtn_range_id"
    t.index ["mtn_range_id"], name: "index_mountains_on_mtn_range_id"
  end

  create_table "mtn_ranges", force: :cascade do |t|
    t.string "name"
    t.boolean "natl_park_land"
    t.integer "drivetime"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "parks", force: :cascade do |t|
    t.string "name"
    t.integer "entrance_fee"
    t.boolean "ocean_access"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "hikes", "parks"
  add_foreign_key "mountains", "mtn_ranges"
end
