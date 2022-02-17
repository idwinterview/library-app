# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_02_17_210544) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "number"
    t.string "street"
    t.string "second_address_line"
    t.integer "zip"
    t.string "state", limit: 2
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "library_id"
    t.index ["library_id"], name: "index_addresses_on_library_id"
  end

  create_table "books", force: :cascade do |t|
    t.string "type", limit: 20
    t.integer "isbn"
    t.string "title", limit: 50
    t.string "author", limit: 50
    t.string "category", limit: 50
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "description", default: "No description yet"
    t.bigint "library_id"
    t.index ["library_id"], name: "index_books_on_library_id"
  end

  create_table "counties", force: :cascade do |t|
    t.string "name"
    t.string "zip_code"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "customer_books", force: :cascade do |t|
    t.bigint "book_id"
    t.bigint "user_id"
    t.string "status", limit: 15, default: "checked out"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "library_id"
    t.index ["book_id"], name: "index_customer_books_on_book_id"
    t.index ["library_id"], name: "index_customer_books_on_library_id"
    t.index ["user_id"], name: "index_customer_books_on_user_id"
  end

  create_table "libraries", force: :cascade do |t|
    t.string "name"
    t.string "phone_number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "county_id"
    t.index ["county_id"], name: "index_libraries_on_county_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "type", limit: 10
    t.string "first_name", limit: 50
    t.string "last_name", limit: 50
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "library_id"
    t.index ["library_id"], name: "index_users_on_library_id"
  end

  add_foreign_key "addresses", "libraries"
  add_foreign_key "books", "libraries"
  add_foreign_key "customer_books", "books"
  add_foreign_key "customer_books", "libraries"
  add_foreign_key "customer_books", "users"
  add_foreign_key "libraries", "counties"
  add_foreign_key "users", "libraries"
end
