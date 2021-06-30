# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_06_30_132709) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "broker_stocks", force: :cascade do |t|
    t.integer "user_id"
    t.integer "stock_id"
    t.string "company"
    t.float "price"
    t.string "ticker"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "buyer_stocks", force: :cascade do |t|
    t.integer "user_id"
    t.integer "stock_id"
    t.string "company"
    t.float "price"
    t.float "total_price"
    t.integer "quantity"
    t.string "ticker"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "change_percent"
  end

  create_table "stocks", force: :cascade do |t|
    t.string "company"
    t.float "price"
    t.string "ticker"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "change_percent"
  end

  create_table "transactions", force: :cascade do |t|
    t.integer "stock_id"
    t.integer "broker_id"
    t.string "company"
    t.float "price"
    t.float "total_price"
    t.integer "quantity"
    t.string "ticker"
    t.datetime "created_at", precision: 6, null: false
    t.integer "buyer_id"
    t.string "buyer"
    t.string "seller"
  end

  create_table "user_stocks", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "stock_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["stock_id"], name: "index_user_stocks_on_stock_id"
    t.index ["user_id"], name: "index_user_stocks_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "role"
    t.string "status"
    t.float "money"
    t.string "password_digest"
    t.string "email"
    t.string "username"
    t.string "broker_role"
    t.string "first_name"
    t.string "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "user_stocks", "stocks"
  add_foreign_key "user_stocks", "users"
end
