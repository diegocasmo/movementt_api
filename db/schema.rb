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

ActiveRecord::Schema.define(version: 2021_12_14_223506) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "exercises", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name", limit: 255, default: "", null: false
    t.integer "movement_type", limit: 2, default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_exercises_on_user_id"
  end

  create_table "routine_exercises", force: :cascade do |t|
    t.bigint "routine_id", null: false
    t.string "name", limit: 255, default: "", null: false
    t.integer "category_type", limit: 2, default: 0, null: false
    t.integer "movement_type", limit: 2, default: 0, null: false
    t.integer "weight_unit_type", limit: 2, default: 0, null: false
    t.integer "quantity", default: 1, null: false
    t.float "weight", default: 0.0, null: false
    t.integer "rest_seconds", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "position", default: 0, null: false
    t.index ["routine_id"], name: "index_routine_exercises_on_routine_id"
  end

  create_table "routines", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name", limit: 255, default: "", null: false
    t.integer "rounds", default: 1, null: false
    t.integer "rest_seconds", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_routines_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "uid", limit: 255, default: "", null: false
    t.string "email", limit: 255, default: "", null: false
    t.boolean "verified", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "weight_unit_type", limit: 2, default: 0, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["uid"], name: "index_users_on_uid", unique: true
  end

  create_table "workout_exercises", force: :cascade do |t|
    t.bigint "workout_id", null: false
    t.string "name", limit: 255, default: "", null: false
    t.integer "category_type", limit: 2, default: 0, null: false
    t.integer "movement_type", limit: 2, default: 0, null: false
    t.integer "weight_unit_type", limit: 2, default: 0, null: false
    t.integer "quantity", default: 1, null: false
    t.float "weight", default: 0.0, null: false
    t.integer "rest_seconds", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["workout_id"], name: "index_workout_exercises_on_workout_id"
  end

  create_table "workouts", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name", limit: 255, default: "", null: false
    t.integer "rounds", default: 1, null: false
    t.integer "rest_seconds", default: 0, null: false
    t.integer "rounds_completed", default: 0, null: false
    t.integer "elapsed_ms", default: 1, null: false
    t.datetime "started_at", null: false
    t.datetime "completed_at", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_workouts_on_user_id"
  end

  add_foreign_key "exercises", "users", on_update: :restrict, on_delete: :cascade
  add_foreign_key "routine_exercises", "routines", on_update: :restrict, on_delete: :cascade
  add_foreign_key "routines", "users", on_update: :restrict, on_delete: :cascade
  add_foreign_key "workout_exercises", "workouts", on_update: :restrict, on_delete: :cascade
  add_foreign_key "workouts", "users", on_update: :restrict, on_delete: :cascade
end
