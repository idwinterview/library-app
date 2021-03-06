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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20180523144616) do

  create_table "books", :force => true do |t|
    t.string   "type",       :limit => 20
    t.integer  "isbn"
    t.string   "title",      :limit => 50
    t.string   "author",     :limit => 50
    t.string   "category",   :limit => 50
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  create_table "customer_books", :force => true do |t|
    t.integer  "customer_id"
    t.integer  "book_id"
    t.string   "status",      :limit => 15, :default => "checked out"
    t.datetime "created_at",                                           :null => false
    t.datetime "updated_at",                                           :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "type",       :limit => 10
    t.string   "first_name", :limit => 50
    t.string   "last_name",  :limit => 50
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

end
