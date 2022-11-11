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

ActiveRecord::Schema[7.0].define(version: 2022_11_03_193725) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "alternatives", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "body"
    t.uuid "question_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "correct"
    t.integer "position"
    t.index ["question_id"], name: "index_alternatives_on_question_id"
  end

  create_table "answers", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "room_id", null: false
    t.uuid "question_id", null: false
    t.uuid "alternative_id", null: false
    t.uuid "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["alternative_id"], name: "index_answers_on_alternative_id"
    t.index ["question_id"], name: "index_answers_on_question_id"
    t.index ["room_id"], name: "index_answers_on_room_id"
    t.index ["user_id"], name: "index_answers_on_user_id"
  end

  create_table "questionaires", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questions", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "body"
    t.uuid "questionaire_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "previous_question_id"
    t.index ["previous_question_id"], name: "index_questions_on_previous_question_id"
    t.index ["questionaire_id"], name: "index_questions_on_questionaire_id"
  end

  create_table "rooms", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "state", default: 0
    t.uuid "questionaire_id"
    t.uuid "current_question_id"
    t.index ["current_question_id"], name: "index_rooms_on_current_question_id"
    t.index ["questionaire_id"], name: "index_rooms_on_questionaire_id"
  end

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "room_id"
    t.index ["room_id"], name: "index_users_on_room_id"
  end

  add_foreign_key "alternatives", "questions"
  add_foreign_key "answers", "alternatives"
  add_foreign_key "answers", "questions"
  add_foreign_key "answers", "rooms"
  add_foreign_key "answers", "users"
  add_foreign_key "questions", "questionaires"
  add_foreign_key "questions", "rooms", column: "previous_question_id"
  add_foreign_key "rooms", "questionaires"
  add_foreign_key "rooms", "questions", column: "current_question_id"
  add_foreign_key "users", "rooms"
end
