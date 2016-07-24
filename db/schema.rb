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

ActiveRecord::Schema.define(version: 20160621031443) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cars", force: :cascade do |t|
    t.integer  "year"
    t.string   "model"
    t.integer  "places"
    t.string   "register"
    t.string   "picture"
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_cars_on_user_id", using: :btree
  end

  create_table "conversations", force: :cascade do |t|
    t.string   "subject"
    t.integer  "travel_id",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["travel_id"], name: "index_conversations_on_travel_id", using: :btree
  end

  create_table "conversations_users", id: false, force: :cascade do |t|
    t.integer "user_id",         null: false
    t.integer "conversation_id", null: false
    t.index ["conversation_id"], name: "index_conversations_users_on_conversation_id", using: :btree
    t.index ["user_id"], name: "index_conversations_users_on_user_id", using: :btree
  end

  create_table "messages", force: :cascade do |t|
    t.string   "body"
    t.integer  "conversation_id", null: false
    t.integer  "user_id",         null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["conversation_id"], name: "index_messages_on_conversation_id", using: :btree
    t.index ["user_id"], name: "index_messages_on_user_id", using: :btree
  end

  create_table "travels", force: :cascade do |t|
    t.date     "departure"
    t.decimal  "latitude",         precision: 10, scale: 6
    t.decimal  "longitude",        precision: 10, scale: 6
    t.integer  "available_places"
    t.string   "description"
    t.string   "origin"
    t.string   "destination"
    t.integer  "car_id",                                    null: false
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.index ["car_id"], name: "index_travels_on_car_id", using: :btree
    t.index ["destination"], name: "index_travels_on_destination", using: :btree
    t.index ["origin"], name: "index_travels_on_origin", using: :btree
  end

  create_table "travels_users", id: false, force: :cascade do |t|
    t.integer "user_id",   null: false
    t.integer "travel_id", null: false
    t.index ["travel_id"], name: "index_travels_users_on_travel_id", using: :btree
    t.index ["user_id"], name: "index_travels_users_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.text     "first_name"
    t.text     "last_name"
    t.text     "facebook_image_url"
    t.text     "location"
    t.text     "facebook_url"
    t.text     "gender"
    t.date     "birth_date"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "provider"
    t.string   "uid"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
