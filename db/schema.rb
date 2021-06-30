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

ActiveRecord::Schema.define(version: 2021_06_29_151146) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "stocks", force: :cascade do |t|
    t.string "ticker"
    t.string "name"
    t.decimal "last_price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "logo"
    t.string "description"
    t.index ["ticker"], name: "index_stocks_on_ticker", unique: true
  end

  create_table "transactionrecords", force: :cascade do |t|
    t.decimal "stock_price"
    t.integer "quantity"
    t.decimal "total_price"
    t.integer "transaction_type"
    t.bigint "stock_id", null: false
    t.bigint "broker_id", null: false
    t.bigint "buyer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["broker_id"], name: "index_transactionrecords_on_broker_id"
    t.index ["buyer_id"], name: "index_transactionrecords_on_buyer_id"
    t.index ["stock_id"], name: "index_transactionrecords_on_stock_id"
  end

  create_table "user_stocks", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "stock_id", null: false
    t.decimal "average_price"
    t.integer "total_shares"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["stock_id"], name: "index_user_stocks_on_stock_id"
    t.index ["user_id"], name: "index_user_stocks_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "username", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "role"
    t.boolean "approved", default: false, null: false
    t.index ["approved"], name: "index_users_on_approved"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "transactionrecords", "stocks"
  add_foreign_key "transactionrecords", "users", column: "broker_id"
  add_foreign_key "transactionrecords", "users", column: "buyer_id"
  add_foreign_key "user_stocks", "stocks"
  add_foreign_key "user_stocks", "users"
end
