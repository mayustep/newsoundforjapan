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

ActiveRecord::Schema.define(version: 20160509095615) do

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["priority", "run_at"], name: "delayed_jobs_priority"
  end

  create_table "funds", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "goals", force: :cascade do |t|
    t.integer  "amount"
    t.string   "currency"
    t.string   "name"
    t.integer  "fund_id"
    t.integer  "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "image_name"
    t.string   "image_uid"
  end

  create_table "pages", id: false, force: :cascade do |t|
    t.string   "id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payments", force: :cascade do |t|
    t.integer  "fund_id"
    t.integer  "user_id"
    t.integer  "amount"
    t.string   "currency"
    t.boolean  "confirmed"
    t.boolean  "public"
    t.string   "transaction_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.datetime "refunded_at"
    t.string   "image_name"
    t.string   "image_uid"
    t.string   "url"
  end

  create_table "sessions", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "translations", force: :cascade do |t|
    t.integer  "translatable_id"
    t.string   "translatable_type"
    t.string   "translatable_field"
    t.text     "locale"
    t.text     "text"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "uploads", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "file_name"
    t.string   "file_uid"
    t.string   "mime_type"
    t.string   "through"
    t.integer  "bytes"
    t.integer  "attachable_id"
    t.string   "attachable_type"
    t.integer  "position"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "locale"
  end

end
