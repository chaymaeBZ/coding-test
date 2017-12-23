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

ActiveRecord::Schema.define(version: 20171220154535) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "alarms", id: :serial, force: :cascade do |t|
    t.integer "limit"
    t.boolean "notified", default: false
    t.integer "user_id"
    t.integer "storage_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["storage_id"], name: "index_alarms_on_storage_id"
    t.index ["user_id"], name: "index_alarms_on_user_id"
  end

  create_table "cloud_accounts", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_cloud_accounts_on_user_id"
  end

  create_table "mentions", force: :cascade do |t|
    t.bigint "tweet_id"
    t.string "username"
    t.string "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "user_screen_name"
  end

  create_table "replies", force: :cascade do |t|
    t.string "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "storages", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.integer "size"
    t.integer "cloud_account_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "kind"
    t.string "type"
    t.date "creation_time"
    t.string "access_key"
    t.integer "user_id"
    t.index ["cloud_account_id"], name: "index_storages_on_cloud_account_id"
    t.index ["user_id"], name: "index_storages_on_user_id"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
  end

  add_foreign_key "alarms", "storages"
  add_foreign_key "alarms", "users"
  add_foreign_key "cloud_accounts", "users"
  add_foreign_key "storages", "cloud_accounts"
  add_foreign_key "storages", "users"
end
