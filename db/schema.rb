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

ActiveRecord::Schema.define(version: 20160810004519) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "multi_choices", force: :cascade do |t|
    t.text     "description"
    t.integer  "options_count", default: 0
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "number_choices", force: :cascade do |t|
    t.integer "choice"
    t.integer "response_id"
    t.index ["response_id"], name: "index_number_choices_on_response_id", using: :btree
  end

  create_table "number_ranges", force: :cascade do |t|
    t.integer  "min",         default: 1
    t.integer  "max",         default: 5
    t.integer  "selected",    default: 5
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.text     "description"
  end

  create_table "option_choices", force: :cascade do |t|
    t.string  "choice"
    t.integer "response_id"
    t.index ["response_id"], name: "index_option_choices_on_response_id", using: :btree
  end

  create_table "options", force: :cascade do |t|
    t.string   "description"
    t.boolean  "selected",        default: false
    t.string   "optionable_type"
    t.integer  "optionable_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.index ["optionable_type", "optionable_id"], name: "index_options_on_optionable_type_and_optionable_id", using: :btree
  end

  create_table "questions", force: :cascade do |t|
    t.integer  "survey_id"
    t.string   "questionable_type"
    t.integer  "questionable_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["questionable_type", "questionable_id"], name: "index_questions_on_questionable_type_and_questionable_id", using: :btree
    t.index ["survey_id"], name: "index_questions_on_survey_id", using: :btree
  end

  create_table "responses", force: :cascade do |t|
    t.string   "multi_choice"
    t.string   "single_choice"
    t.integer  "range"
    t.integer  "survey_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["survey_id"], name: "index_responses_on_survey_id", using: :btree
  end

  create_table "single_choices", force: :cascade do |t|
    t.text     "description"
    t.integer  "options_count", default: 0
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "surveys", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "questions_count", default: 0
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_foreign_key "number_choices", "responses"
  add_foreign_key "option_choices", "responses"
  add_foreign_key "questions", "surveys"
  add_foreign_key "responses", "surveys"
end
