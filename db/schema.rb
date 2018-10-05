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

ActiveRecord::Schema.define(version: 20180721053212) do

  create_table "authorized_vehicles", force: :cascade do |t|
    t.string   "car_plate",  limit: 255
    t.string   "brand",      limit: 255
    t.string   "color",      limit: 255
    t.string   "style",      limit: 255
    t.string   "other",      limit: 255
    t.integer  "filial_id",  limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "authorized_vehicles", ["filial_id"], name: "index_authorized_vehicles_on_filial_id", using: :btree

  create_table "competence_types", force: :cascade do |t|
    t.string   "code",       limit: 255
    t.string   "name",       limit: 255
    t.boolean  "required"
    t.string   "details",    limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "competences", force: :cascade do |t|
    t.string   "code",               limit: 255
    t.string   "name",               limit: 255
    t.boolean  "required"
    t.boolean  "active"
    t.integer  "competence_type_id", limit: 4
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "competences", ["competence_type_id"], name: "index_competences_on_competence_type_id", using: :btree

  create_table "condominia", force: :cascade do |t|
    t.string   "first_name",     limit: 255
    t.string   "last_name",      limit: 255
    t.string   "identification", limit: 255
    t.integer  "filial_number",  limit: 4
    t.string   "phone_number",   limit: 255
    t.decimal  "status",                     precision: 10
    t.boolean  "active"
    t.date     "birthday"
    t.integer  "filial_id",      limit: 4
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
  end

  add_index "condominia", ["filial_id"], name: "index_condominia_on_filial_id", using: :btree

  create_table "condominium_children", force: :cascade do |t|
    t.string   "first_name",     limit: 255
    t.string   "last_name",      limit: 255
    t.string   "identification", limit: 255
    t.string   "car_plate",      limit: 255
    t.integer  "filial_id",      limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "condominium_children", ["filial_id"], name: "index_condominium_children_on_filial_id", using: :btree

  create_table "filials", force: :cascade do |t|
    t.string   "number",      limit: 255
    t.string   "filial_name", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "people", force: :cascade do |t|
    t.string   "first_name",     limit: 255
    t.string   "last_name",      limit: 255
    t.string   "identification", limit: 255
    t.string   "nationality",    limit: 255
    t.string   "car_plate",      limit: 255
    t.integer  "person_type_id", limit: 4
    t.integer  "filial_id",      limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "people", ["filial_id"], name: "index_people_on_filial_id", using: :btree
  add_index "people", ["person_type_id"], name: "index_people_on_person_type_id", using: :btree

  create_table "person_questions", force: :cascade do |t|
    t.integer  "person_id",   limit: 4
    t.integer  "question_id", limit: 4
    t.boolean  "status"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "person_questions", ["person_id"], name: "index_person_questions_on_person_id", using: :btree
  add_index "person_questions", ["question_id"], name: "index_person_questions_on_question_id", using: :btree

  create_table "person_schedules", force: :cascade do |t|
    t.integer  "person_id",  limit: 4
    t.time     "start_time"
    t.time     "end_time"
    t.boolean  "monday"
    t.boolean  "tuesday"
    t.boolean  "wednesday"
    t.boolean  "thursday"
    t.boolean  "friday"
    t.boolean  "saturday"
    t.boolean  "sunday"
    t.boolean  "holidays"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "person_schedules", ["person_id"], name: "index_person_schedules_on_person_id", using: :btree

  create_table "person_types", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.decimal  "code",                   precision: 10
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  create_table "questions", force: :cascade do |t|
    t.string   "question",       limit: 255
    t.boolean  "active"
    t.boolean  "required"
    t.integer  "person_type_id", limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "questions", ["person_type_id"], name: "index_questions_on_person_type_id", using: :btree

  create_table "user_competences", force: :cascade do |t|
    t.integer  "user_id",       limit: 4
    t.integer  "competence_id", limit: 4
    t.boolean  "status"
    t.string   "details",       limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "user_competences", ["competence_id"], name: "index_user_competences_on_competence_id", using: :btree
  add_index "user_competences", ["user_id"], name: "index_user_competences_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name",          limit: 255
    t.string   "last_name",           limit: 255
    t.integer  "identification",      limit: 4
    t.date     "birthday"
    t.string   "phone_number",        limit: 255
    t.boolean  "active"
    t.decimal  "status",                          precision: 10
    t.datetime "created_at",                                                  null: false
    t.datetime "updated_at",                                                  null: false
    t.decimal  "user_type",                       precision: 10, default: 99, null: false
    t.string   "login",               limit: 255
    t.string   "email",               limit: 255,                default: "", null: false
    t.string   "password_digest",     limit: 255,                default: "", null: false
    t.integer  "sign_in_count",       limit: 4,                  default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",  limit: 255
    t.string   "last_sign_in_ip",     limit: 255
    t.integer  "failed_attempts",     limit: 4,                  default: 0,  null: false
    t.boolean  "locked"
    t.datetime "locked_at"
    t.string   "avatar_file_name",    limit: 255
    t.string   "avatar_content_type", limit: 255
    t.integer  "avatar_file_size",    limit: 4
    t.datetime "avatar_updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["identification"], name: "index_users_on_identification", unique: true, using: :btree
  add_index "users", ["login"], name: "index_users_on_login", unique: true, using: :btree

  add_foreign_key "authorized_vehicles", "filials"
  add_foreign_key "competences", "competence_types"
  add_foreign_key "condominia", "filials"
  add_foreign_key "condominium_children", "filials"
  add_foreign_key "people", "filials"
  add_foreign_key "people", "person_types"
  add_foreign_key "person_questions", "people"
  add_foreign_key "person_questions", "questions"
  add_foreign_key "person_schedules", "people"
  add_foreign_key "questions", "person_types"
  add_foreign_key "user_competences", "competences"
  add_foreign_key "user_competences", "users"
end
