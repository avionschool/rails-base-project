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

ActiveRecord::Schema.define(version: 2021_06_19_055803) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "buyer_stocks", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.decimal "price"
    t.integer "quantity"
    t.string "broker_email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "stockSymbol"
    t.index ["user_id"], name: "index_buyer_stocks_on_user_id"
  end

  create_table "purchase_transactions", force: :cascade do |t|
    t.string "stock_code"
    t.decimal "price"
    t.integer "volume"
    t.decimal "total_value"
    t.string "broker_name"
    t.string "company_name"
    t.bigint "user_id", null: false
    t.bigint "broker_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "stock_id"
    t.index ["broker_id"], name: "index_purchase_transactions_on_broker_id"
    t.index ["user_id"], name: "index_purchase_transactions_on_user_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource_type_and_resource_id"
  end

  create_table "stocks", force: :cascade do |t|
    t.string "symbol"
    t.string "name"
    t.decimal "current_price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_stocks_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
    t.string "type"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

  add_foreign_key "buyer_stocks", "users"
  add_foreign_key "purchase_transactions", "users"
  add_foreign_key "purchase_transactions", "users", column: "broker_id"
  add_foreign_key "stocks", "users"
end
