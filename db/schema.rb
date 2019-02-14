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

ActiveRecord::Schema.define(version: 20190213224126) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "books", force: :cascade do |t|
    t.string   "type",       limit: 20
    t.integer  "isbn"
    t.string   "title",      limit: 50
    t.string   "author",     limit: 50
    t.string   "category",   limit: 50
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "customer_books", force: :cascade do |t|
    t.integer  "customer_id"
    t.integer  "bookable_id"
    t.string   "status",        limit: 15, default: "checked out"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "bookable_type"
  end

  create_table "users", force: :cascade do |t|
    t.string   "type",       limit: 10
    t.string   "first_name", limit: 50
    t.string   "last_name",  limit: 50
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
