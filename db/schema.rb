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

ActiveRecord::Schema.define(version: 2022_01_13_105034) do

  create_table "admins", force: :cascade do |t|
    t.string "account_type", default: "admin"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.integer "sign_in_count", default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.integer "failed_attempts", default: 0
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "remember_created_at"
  end

  create_table "broker_stocks", force: :cascade do |t|
    t.integer "broker_id", null: false
    t.integer "stock_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["broker_id"], name: "index_broker_stocks_on_broker_id"
    t.index ["stock_id"], name: "index_broker_stocks_on_stock_id"
  end

  create_table "brokers", force: :cascade do |t|
    t.string "account_type", default: "broker"
    t.string "broker_name"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "admin_id"
    t.index ["admin_id"], name: "index_brokers_on_admin_id"
    t.index ["email"], name: "index_brokers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_brokers_on_reset_password_token", unique: true
  end

  create_table "buyer_stocks", force: :cascade do |t|
    t.integer "buyer_id", null: false
    t.integer "stock_id", null: false
    t.integer "quantity"
    t.float "stock_price"
    t.integer "broker_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["buyer_id"], name: "index_buyer_stocks_on_buyer_id"
    t.index ["stock_id"], name: "index_buyer_stocks_on_stock_id"
  end

  create_table "buyers", force: :cascade do |t|
    t.string "account_type", default: "buyer"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "admin_id"
    t.index ["admin_id"], name: "index_buyers_on_admin_id"
    t.index ["email"], name: "index_buyers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_buyers_on_reset_password_token", unique: true
  end

  create_table "stocks", force: :cascade do |t|
    t.string "ticker"
    t.string "name"
    t.decimal "last_price"
    t.integer "quantity"
    t.float "stock_price"
    t.string "logo"
    t.integer "added_by"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "transactions", force: :cascade do |t|
    t.integer "broker_id", null: false
    t.integer "stock_id", null: false
    t.integer "buyer_id", null: false
    t.string "ticker"
    t.string "company_name"
    t.string "stock_price"
    t.string "quantity"
    t.string "broker_name"
    t.string "buyer_email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["broker_id"], name: "index_transactions_on_broker_id"
    t.index ["buyer_id"], name: "index_transactions_on_buyer_id"
    t.index ["stock_id"], name: "index_transactions_on_stock_id"
  end

  add_foreign_key "broker_stocks", "brokers"
  add_foreign_key "broker_stocks", "stocks"
  add_foreign_key "brokers", "admins"
  add_foreign_key "buyer_stocks", "buyers"
  add_foreign_key "buyer_stocks", "stocks"
  add_foreign_key "buyers", "admins"
end
