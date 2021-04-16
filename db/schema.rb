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

ActiveRecord::Schema.define(version: 2021_04_16_121048) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "buyers_stocks", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "stocks_id"
    t.index ["stocks_id"], name: "index_buyers_stocks_on_stocks_id"
    t.index ["user_id"], name: "index_buyers_stocks_on_user_id"
  end

  create_table "stocks", force: :cascade do |t|
    t.string "symbol"
    t.string "name"
    t.integer "current_Price"
    t.integer "change"
    t.integer "previous_close"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "transactions", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "buyersstocks_id"
    t.date "transactions_date"
    t.boolean "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["buyersstocks_id"], name: "index_transactions_on_buyersstocks_id"
    t.index ["user_id"], name: "index_transactions_on_user_id"
  end

end
