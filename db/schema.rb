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

ActiveRecord::Schema.define(version: 2021_07_15_164138) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "builds", force: :cascade do |t|
    t.string "name"
    t.string "purpose"
    t.float "total_price"
    t.bigint "user_id"
    t.bigint "cpu_id"
    t.bigint "gpu_id"
    t.bigint "mobo_id"
    t.bigint "psu_id"
    t.bigint "storage_id"
    t.bigint "case_id"
    t.bigint "case_fan_id"
    t.bigint "cpu_fan_id"
    t.bigint "ram_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["case_fan_id"], name: "index_builds_on_case_fan_id"
    t.index ["case_id"], name: "index_builds_on_case_id"
    t.index ["cpu_fan_id"], name: "index_builds_on_cpu_fan_id"
    t.index ["cpu_id"], name: "index_builds_on_cpu_id"
    t.index ["gpu_id"], name: "index_builds_on_gpu_id"
    t.index ["mobo_id"], name: "index_builds_on_mobo_id"
    t.index ["psu_id"], name: "index_builds_on_psu_id"
    t.index ["ram_id"], name: "index_builds_on_ram_id"
    t.index ["storage_id"], name: "index_builds_on_storage_id"
    t.index ["user_id"], name: "index_builds_on_user_id"
  end

  create_table "case_fans", force: :cascade do |t|
    t.string "size"
    t.string "color"
    t.string "rpm"
    t.string "airflow"
    t.string "noise_level"
    t.boolean "pwm"
    t.string "rating"
    t.float "price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.string "image"
  end

  create_table "cases", force: :cascade do |t|
    t.string "type"
    t.string "color"
    t.boolean "power_supply"
    t.string "side_panel_window"
    t.integer "external_525_bays"
    t.integer "internal_325_bays"
    t.string "rating"
    t.float "price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.string "image"
  end

  create_table "cpu_fans", force: :cascade do |t|
    t.string "fan_rpm"
    t.string "noise_level"
    t.string "radiator_size"
    t.string "color"
    t.string "rating"
    t.float "price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.string "image"
  end

  create_table "cpus", force: :cascade do |t|
    t.string "socket"
    t.integer "core_count"
    t.integer "core_clock"
    t.integer "boost_clock"
    t.string "tdp"
    t.boolean "smt"
    t.string "rating"
    t.float "price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.string "image"
  end

  create_table "gpus", force: :cascade do |t|
    t.string "chipset"
    t.integer "core_clock"
    t.integer "boost_clock"
    t.string "color"
    t.string "length"
    t.string "rating"
    t.float "price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.string "image"
  end

  create_table "mobos", force: :cascade do |t|
    t.string "socket_cpu", array: true
    t.string "form_factor"
    t.integer "max_memory"
    t.integer "memory_slots"
    t.string "color"
    t.string "rating"
    t.float "price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.string "image"
  end

  create_table "psus", force: :cascade do |t|
    t.string "form_factor"
    t.integer "efficiency_rating"
    t.integer "wattage"
    t.boolean "modular"
    t.string "color"
    t.string "rating"
    t.float "price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.string "image"
  end

  create_table "rams", force: :cascade do |t|
    t.string "speed"
    t.string "module"
    t.integer "latency"
    t.integer "quantity"
    t.string "color"
    t.string "rating"
    t.float "price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.string "image"
  end

  create_table "storages", force: :cascade do |t|
    t.string "capacity"
    t.string "type"
    t.integer "cache"
    t.string "form_factor"
    t.string "interface"
    t.string "rating"
    t.float "price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.string "image"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "username"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
