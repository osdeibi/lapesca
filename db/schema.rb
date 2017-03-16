# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20170316022306) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "calendar_dates", force: :cascade do |t|
    t.date     "actual_date"
    t.boolean  "pescalinda"
    t.boolean  "palma"
    t.boolean  "tropicana"
    t.boolean  "nuevoamanecer"
    t.boolean  "blanquita"
    t.boolean  "maria"
    t.boolean  "marina"
    t.boolean  "escollera"
    t.boolean  "villa"
    t.boolean  "puntapiedra"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "hotels", force: :cascade do |t|
    t.string   "name"
    t.decimal  "cost_per_night"
    t.text     "description"
    t.boolean  "grill"
    t.boolean  "pool"
    t.boolean  "dock"
    t.boolean  "restaurant"
    t.boolean  "shacks"
    t.boolean  "pet_friendly"
    t.integer  "available"
    t.integer  "review_score"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "home_file_name"
    t.string   "home_content_type"
    t.integer  "home_file_size"
    t.datetime "home_updated_at"
    t.string   "index_file_name"
    t.string   "index_content_type"
    t.integer  "index_file_size"
    t.datetime "index_updated_at"
    t.string   "page_file_name"
    t.string   "page_content_type"
    t.integer  "page_file_size"
    t.datetime "page_updated_at"
    t.integer  "category"
    t.string   "location"
    t.text     "long_description"
    t.string   "small_file_name"
    t.string   "small_content_type"
    t.integer  "small_file_size"
    t.datetime "small_updated_at"
    t.boolean  "tv"
    t.string   "code"
    t.integer  "score"
    t.boolean  "air_conditioner"
  end

  create_table "reservations", force: :cascade do |t|
    t.string   "name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone"
    t.date     "check_in"
    t.date     "check_out"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "hotel_id"
    t.string   "token"
    t.integer  "room_id"
    t.integer  "status",         default: 0
    t.text     "rooms"
    t.decimal  "cost"
    t.decimal  "paid_amount"
    t.decimal  "reserve_amount"
  end

  add_index "reservations", ["hotel_id"], name: "index_reservations_on_hotel_id", using: :btree
  add_index "reservations", ["room_id"], name: "index_reservations_on_room_id", using: :btree

  create_table "rooms", force: :cascade do |t|
    t.string   "name"
    t.decimal  "price"
    t.integer  "hotel_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "rooms", ["hotel_id"], name: "index_rooms_on_hotel_id", using: :btree

  add_foreign_key "reservations", "hotels"
  add_foreign_key "reservations", "rooms"
  add_foreign_key "rooms", "hotels"
end
