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

ActiveRecord::Schema.define(version: 20161008043031) do

  create_table "availabilities", force: :cascade do |t|
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.string   "email",      limit: 50
    t.string   "day",        limit: 15
    t.string   "time"
    t.string   "duration"
    t.index ["email"], name: "index_availabilities_on_email"
  end

  create_table "free_play_rooms", force: :cascade do |t|
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.string   "email",      limit: 50
    t.date     "date"
    t.string   "time"
    t.string   "duration"
    t.index ["email"], name: "index_free_play_rooms_on_email"
  end

  create_table "interviews", force: :cascade do |t|
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "email",         limit: 50
    t.string   "teacher_email", limit: 50
    t.date     "date"
    t.string   "time"
    t.string   "duration"
    t.index ["email"], name: "index_interviews_on_email"
  end

  create_table "lessons", force: :cascade do |t|
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "email",           limit: 50
    t.string   "student_email",   limit: 50
    t.date     "start_date"
    t.date     "end_date"
    t.string   "day",             limit: 15
    t.string   "lesson_time"
    t.string   "lesson_type"
    t.string   "lesson_duration"
    t.string   "lesson_cost"
    t.index ["email"], name: "index_lessons_on_email"
  end

  create_table "preferences", force: :cascade do |t|
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.string   "email",                      limit: 50
    t.string   "preferred_day",              limit: 15
    t.string   "preferred_time"
    t.string   "instrument",                 limit: 50
    t.string   "preferred_teacher_language", limit: 30
    t.string   "preferred_teacher_gender",   limit: 10
    t.index ["email"], name: "index_preferences_on_email"
  end

  create_table "skills", force: :cascade do |t|
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "email",               limit: 50
    t.string   "instrument_1"
    t.string   "instrument_1_skils"
    t.string   "instrument_2"
    t.string   "instrument_2_skills"
    t.string   "language_1"
    t.string   "language_1_skils"
    t.string   "language_2"
    t.string   "language_2_skills"
    t.index ["email"], name: "index_skills_on_email"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "password_digest"
    t.string   "last_name"
    t.string   "gender"
    t.text     "dob"
    t.string   "facebook_ID"
    t.string   "remember_digest"
    t.string   "teacher_qualifications"
    t.boolean  "teacher"
    t.boolean  "admin"
    t.string   "parent_name"
    t.string   "parent_email"
    t.string   "address"
    t.string   "parent_moblie"
    t.boolean  "user_recieve_emails"
    t.boolean  "parent_recieve_emails"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
