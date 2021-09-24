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

ActiveRecord::Schema.define(version: 2021_09_24_122920) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "buy_orders", force: :cascade do |t|
    t.string "indicator"
    t.float "quantity"
    t.float "price"
    t.float "total_amount"
    t.bigint "user_id", null: false
    t.bigint "stock_id", null: false
    t.integer "status", default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["stock_id"], name: "index_buy_orders_on_stock_id"
    t.index ["user_id"], name: "index_buy_orders_on_user_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "role"
    t.index ["role"], name: "index_roles_on_role", unique: true
  end

  create_table "sell_orders", force: :cascade do |t|
    t.string "indicator"
    t.float "quantity"
    t.float "price"
    t.float "total_amount"
    t.bigint "user_id", null: false
    t.bigint "stock_id", null: false
    t.integer "status", default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["stock_id"], name: "index_sell_orders_on_stock_id"
    t.index ["user_id"], name: "index_sell_orders_on_user_id"
  end

  create_table "stocks", force: :cascade do |t|
    t.string "ticker"
    t.string "name"
    t.decimal "last_price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "logo"
    t.jsonb "prices"
    t.index ["ticker"], name: "index_stocks_on_ticker", unique: true
  end

  create_table "trades", force: :cascade do |t|
    t.integer "quantity"
    t.float "price"
    t.bigint "buy_order_id", null: false
    t.bigint "sell_order_id"
    t.bigint "stock_id", null: false
    t.index ["buy_order_id"], name: "index_trades_on_buy_order_id"
    t.index ["sell_order_id"], name: "index_trades_on_sell_order_id"
    t.index ["stock_id"], name: "index_trades_on_stock_id"
  end

  create_table "user_portfolios", force: :cascade do |t|
    t.float "quantity"
    t.float "price"
    t.float "total_amount"
    t.float "unrealized"
    t.bigint "user_id", null: false
    t.bigint "stock_id", null: false
    t.index ["stock_id"], name: "index_user_portfolios_on_stock_id"
    t.index ["user_id"], name: "index_user_portfolios_on_user_id"
  end

  create_table "user_roles", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "role_id", null: false
    t.index ["role_id"], name: "index_user_roles_on_role_id"
    t.index ["user_id"], name: "index_user_roles_on_user_id"
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
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "username"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "status"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.boolean "approved"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  create_table "wallets", force: :cascade do |t|
    t.integer "deposit"
    t.integer "withdrawals"
    t.integer "user_id"
  end

  add_foreign_key "buy_orders", "stocks"
  add_foreign_key "buy_orders", "users"
  add_foreign_key "sell_orders", "stocks"
  add_foreign_key "sell_orders", "users"
  add_foreign_key "trades", "buy_orders"
  add_foreign_key "trades", "sell_orders"
  add_foreign_key "trades", "stocks"
  add_foreign_key "user_portfolios", "stocks"
  add_foreign_key "user_portfolios", "users"
  add_foreign_key "user_roles", "roles"
  add_foreign_key "user_roles", "users"
  add_foreign_key "user_stocks", "stocks"
  add_foreign_key "user_stocks", "users"
end
