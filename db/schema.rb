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


ActiveRecord::Schema.define(version: 2021_07_16_075721) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "build_case_fans", force: :cascade do |t|
    t.bigint "build_id", null: false
    t.bigint "case_fan_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["build_id"], name: "index_build_case_fans_on_build_id"
    t.index ["case_fan_id"], name: "index_build_case_fans_on_case_fan_id"
  end

  create_table "build_gpus", force: :cascade do |t|
    t.bigint "build_id", null: false
    t.bigint "gpu_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["build_id"], name: "index_build_gpus_on_build_id"
    t.index ["gpu_id"], name: "index_build_gpus_on_gpu_id"
  end

  create_table "build_rams", force: :cascade do |t|
    t.bigint "build_id", null: false
    t.bigint "ram_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["build_id"], name: "index_build_rams_on_build_id"
    t.index ["ram_id"], name: "index_build_rams_on_ram_id"
  end

  create_table "build_storages", force: :cascade do |t|
    t.bigint "build_id", null: false
    t.bigint "storage_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["build_id"], name: "index_build_storages_on_build_id"
    t.index ["storage_id"], name: "index_build_storages_on_storage_id"
  end

  create_table "builds", force: :cascade do |t|
    t.string "name"
    t.string "purpose"
    t.float "total_price"
    t.bigint "user_id"
    t.bigint "cpu_id"
    t.bigint "mobo_id"
    t.bigint "psu_id"
    t.bigint "case_id"
    t.bigint "cpu_fan_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["case_id"], name: "index_builds_on_case_id"
    t.index ["cpu_fan_id"], name: "index_builds_on_cpu_fan_id"
    t.index ["cpu_id"], name: "index_builds_on_cpu_id"
    t.index ["mobo_id"], name: "index_builds_on_mobo_id"
    t.index ["psu_id"], name: "index_builds_on_psu_id"
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
    t.integer "bay_2_5"
    t.integer "bay_3_5"
    t.string "rating"
    t.float "price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.string "image"
    t.string "motherboard_form_factor", array: true
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
    t.string "supported_socket", array: true
    t.string "height"
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
    t.string "max_memory"
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
    t.string "memory_size"
    t.string "memory_type"
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
    t.string "supported_memory"
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
    t.string "memory_type"
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

  add_foreign_key "build_case_fans", "builds"
  add_foreign_key "build_case_fans", "case_fans"
  add_foreign_key "build_gpus", "builds"
  add_foreign_key "build_gpus", "gpus"
  add_foreign_key "build_rams", "builds"
  add_foreign_key "build_rams", "rams"
  add_foreign_key "build_storages", "builds"
  add_foreign_key "build_storages", "storages"
end
