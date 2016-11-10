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

ActiveRecord::Schema.define(version: 20161110222438) do

  create_table "ar_internal_metadata", primary_key: "key", force: :cascade do |t|
    t.string   "value",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "configurations", force: :cascade do |t|
    t.integer  "basepay",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "costcs", force: :cascade do |t|
    t.integer  "user_id",     limit: 4
    t.string   "code",        limit: 255
    t.string   "name",        limit: 255
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "labors",      limit: 255
  end

  create_table "job_operators", force: :cascade do |t|
    t.integer  "job_id",      limit: 4
    t.integer  "operator_id", limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "job_supervisors", force: :cascade do |t|
    t.integer  "job_id",        limit: 4
    t.integer  "supervisor_id", limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "jobs", force: :cascade do |t|
    t.integer  "user_id",     limit: 4
    t.string   "name",        limit: 255
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "state",       limit: 255
    t.integer  "basepay",     limit: 4
  end

  create_table "labor_costcs", force: :cascade do |t|
    t.integer  "costc_id",   limit: 4
    t.integer  "labor_id",   limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "labor_jobs", force: :cascade do |t|
    t.integer  "labor_id",   limit: 4
    t.integer  "job_id",     limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "labors", force: :cascade do |t|
    t.integer  "user_id",     limit: 4
    t.string   "code",        limit: 255
    t.string   "name",        limit: 255
    t.string   "paymentunit", limit: 255
    t.float    "rate",        limit: 24
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "novelties", force: :cascade do |t|
    t.integer  "supervisor_id", limit: 4
    t.integer  "job_id",        limit: 4
    t.integer  "labor_id",      limit: 4
    t.string   "area",          limit: 255
    t.float    "wageamount",    limit: 24
    t.float    "laboramount",   limit: 24
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "operator_supervisors", force: :cascade do |t|
    t.integer  "supervisor_id", limit: 4
    t.integer  "operator_id",   limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "operators", force: :cascade do |t|
    t.string   "cc",             limit: 255
    t.string   "name",           limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "lastname",       limit: 255
    t.datetime "dateadmission"
    t.string   "state",          limit: 255
    t.integer  "job_id",         limit: 4
    t.datetime "retirementdate"
    t.string   "description",    limit: 255
    t.string   "gender",         limit: 255
    t.string   "transportaid",   limit: 255
  end

  create_table "record_jobs", force: :cascade do |t|
    t.integer  "operator_id",   limit: 4
    t.string   "description",   limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.datetime "changejobdate"
    t.integer  "job_id",        limit: 4
  end

  create_table "record_operators", force: :cascade do |t|
    t.integer  "record_id",   limit: 4
    t.integer  "operator_id", limit: 4
    t.string   "state",       limit: 255
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "records", force: :cascade do |t|
    t.integer  "record_id",      limit: 4
    t.integer  "operator_id",    limit: 4
    t.string   "state",          limit: 255
    t.string   "description",    limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.datetime "dateadmission"
    t.datetime "retirementdate"
    t.datetime "reinstatedate"
    t.integer  "supervisor_id",  limit: 4
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name",          limit: 255
    t.integer  "resource_id",   limit: 4
    t.string   "resource_type", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

  create_table "sublots", force: :cascade do |t|
    t.string   "code",        limit: 255
    t.string   "name",        limit: 255
    t.integer  "user_id",     limit: 4
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "costc_id",    limit: 4
  end

  create_table "supervisors", force: :cascade do |t|
    t.integer  "user_id",        limit: 4
    t.string   "name",           limit: 255
    t.string   "lastname",       limit: 255
    t.string   "state",          limit: 255
    t.datetime "dateadmission"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "job_id",         limit: 4
    t.datetime "retirementdate"
    t.string   "description",    limit: 255
    t.string   "cc",             limit: 255
    t.string   "gender",         limit: 255
    t.string   "transportaid",   limit: 255
  end

  create_table "transcriptions", force: :cascade do |t|
    t.integer  "supervisor_id", limit: 4
    t.integer  "operator_id",   limit: 4
    t.integer  "job_id",        limit: 4
    t.integer  "labor_id",      limit: 4
    t.integer  "costc_id",      limit: 4
    t.integer  "sublot_id",     limit: 4
    t.float    "wageamount",    limit: 24
    t.float    "laboramount",   limit: 24
    t.float    "subtotal",      limit: 24
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id", limit: 4
    t.integer "role_id", limit: 4
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree

end
