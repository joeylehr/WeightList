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

ActiveRecord::Schema.define(version: 20160330010354) do

  create_table "feelings", force: :cascade do |t|
    t.string   "feeling"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "post_feelings", force: :cascade do |t|
    t.integer  "post_id"
    t.integer  "feeling_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "post_workouts", force: :cascade do |t|
    t.integer  "post_id"
    t.integer  "workout_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.date     "entry_date"
    t.integer  "current_weight"
    t.boolean  "worked_out"
    t.integer  "motivation_level"
    t.integer  "weight_journal_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.text     "notes"
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.date     "birth_date"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "email"
    t.string   "password_digest"
  end

  create_table "weight_journals", force: :cascade do |t|
    t.string   "title"
    t.integer  "user_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.date     "start_date"
    t.integer  "starting_weight"
    t.date     "final_weigh_in_date"
    t.integer  "weight_goal"
  end

  create_table "workouts", force: :cascade do |t|
    t.string   "workout_type"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

end
