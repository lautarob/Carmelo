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

ActiveRecord::Schema.define(version: 20160616184347) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cars", force: :cascade do |t|
    t.integer  "year"
    t.string   "model"
    t.integer  "slots"
    t.string   "register"
    t.string   "picture"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_cars_on_user_id", using: :btree
  end

  create_table "conversations", force: :cascade do |t|
    t.string   "subject"
    t.integer  "travel_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["travel_id"], name: "index_conversations_on_travel_id", using: :btree
  end

  create_table "conversations_users", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "conversation_id"
    t.index ["conversation_id"], name: "index_conversations_users_on_conversation_id", using: :btree
    t.index ["user_id"], name: "index_conversations_users_on_user_id", using: :btree
  end

  create_table "messages", force: :cascade do |t|
    t.string   "body"
    t.integer  "conversation_id"
    t.integer  "user_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["conversation_id"], name: "index_messages_on_conversation_id", using: :btree
    t.index ["user_id"], name: "index_messages_on_user_id", using: :btree
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
    t.integer  "car_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["car_id"], name: "index_travels_on_car_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "provider",               default: "email", null: false
    t.string   "uid",                    default: "",      null: false
    t.string   "encrypted_password",     default: "",      null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,       null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "name"
    t.string   "last_name"
    t.string   "city"
    t.string   "province"
    t.string   "country"
    t.string   "enabled"
    t.string   "nickname"
    t.string   "image"
    t.string   "email"
    t.integer  "role",                   default: 0,       null: false
    t.json     "tokens"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["email"], name: "index_users_on_email", using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true, using: :btree
  end

  create_table "users_travels", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "travel_id"
    t.index ["travel_id"], name: "index_users_travels_on_travel_id", using: :btree
    t.index ["user_id"], name: "index_users_travels_on_user_id", using: :btree
  end

end
