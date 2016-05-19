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

ActiveRecord::Schema.define(version: 20160519121845) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cars", force: :cascade do |t|
    t.integer  "year"
    t.string   "model"
    t.integer  "slots"
    t.string   "register"
    t.string   "picture"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cars_travels", id: false, force: :cascade do |t|
    t.integer "car_id"
    t.integer "travel_id"
    t.index ["car_id"], name: "index_cars_travels_on_car_id", using: :btree
    t.index ["travel_id"], name: "index_cars_travels_on_travel_id", using: :btree
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.boolean  "enabled"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "travels", force: :cascade do |t|
    t.float    "travel_time"
    t.date     "departure"
    t.integer  "slots_remaining"
    t.string   "description"
    t.string   "city_origin"
    t.string   "province_origin"
    t.string   "country_origin"
    t.string   "city_destination"
    t.string   "province_destination"
    t.string   "country_destination"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "lastname"
    t.string   "email"
    t.string   "username"
    t.string   "picture"
    t.string   "city"
    t.string   "province"
    t.string   "country"
    t.string   "password"
    t.boolean  "enabled"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users_cars", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "car_id"
    t.index ["car_id"], name: "index_users_cars_on_car_id", using: :btree
    t.index ["user_id"], name: "index_users_cars_on_user_id", using: :btree
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id", using: :btree
    t.index ["user_id"], name: "index_users_roles_on_user_id", using: :btree
  end

end
