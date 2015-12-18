# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20151216213311) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cohorts", force: :cascade do |t|
    t.string  "cohort_name"
    t.date    "start_date"
    t.date    "end_date"
    t.string  "subject"
    t.boolean "full_time"
    t.integer "max_absences", default: 4
  end

  create_table "cohorts_users", id: false, force: :cascade do |t|
    t.integer "cohort_id", null: false
    t.integer "user_id",   null: false
  end

  add_index "cohorts_users", ["cohort_id", "user_id"], name: "index_cohorts_users_on_cohort_id_and_user_id", using: :btree
  add_index "cohorts_users", ["user_id", "cohort_id"], name: "index_cohorts_users_on_user_id_and_cohort_id", using: :btree

  create_table "date_records", force: :cascade do |t|
    t.string  "attendence", default: "present"
    t.date    "day"
    t.integer "student_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "type"
    t.string "email"
    t.string "password_digest"
    t.string "phone"
    t.string "first_name"
    t.string "last_name"
    t.string "img_url"
    t.string "bio"
  end

end
