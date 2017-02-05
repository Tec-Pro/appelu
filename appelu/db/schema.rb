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

ActiveRecord::Schema.define(version: 20170203110916) do

  create_table "businesses", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.boolean  "enable"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "businesses", ["user_id"], name: "index_businesses_on_user_id"

  create_table "customer_service_days", force: :cascade do |t|
    t.integer  "business_id"
    t.string   "day"
    t.time     "openingTime"
    t.time     "openingTime2"
    t.time     "closingTime"
    t.time     "closingTime2"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "customer_service_days", ["business_id"], name: "index_customer_service_days_on_business_id"

  create_table "reserves", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "service_id"
    t.boolean  "enable"
    t.string   "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "reserves", ["service_id"], name: "index_reserves_on_service_id"
  add_index "reserves", ["user_id"], name: "index_reserves_on_user_id"

  create_table "services", force: :cascade do |t|
    t.string   "name"
    t.integer  "duration"
    t.boolean  "enable"
    t.integer  "business_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "services", ["business_id"], name: "index_services_on_business_id"

  create_table "tokens", force: :cascade do |t|
    t.datetime "expires_at"
    t.integer  "user_id"
    t.string   "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "tokens", ["user_id"], name: "index_tokens_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "name"
    t.string   "provider"
    t.string   "uid"
    t.string   "role"
    t.string   "password_hash"
    t.string   "password"
    t.boolean  "enable"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

end
