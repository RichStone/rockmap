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

ActiveRecord::Schema.define(version: 2021_01_08_215025) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accountability_buddies", force: :cascade do |t|
    t.string "email"
    t.boolean "invite_accepted", default: false
    t.integer "reminder_period"
    t.date "last_reminder"
    t.bigint "roadmap_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["roadmap_id"], name: "index_accountability_buddies_on_roadmap_id"
  end

  create_table "milestones", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.date "liveline"
    t.bigint "roadmap_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["roadmap_id"], name: "index_milestones_on_roadmap_id"
  end

  create_table "roadmaps", force: :cascade do |t|
    t.string "the_one_thing"
    t.text "the_why_of_one_thing"
    t.string "the_one_habit"
    t.date "start_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.integer "reminder_period"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.date "last_motivator_date", default: "2021-01-08"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "accountability_buddies", "roadmaps"
  add_foreign_key "milestones", "roadmaps"
end
