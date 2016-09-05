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

ActiveRecord::Schema.define(version: 20160905221124) do

  create_table "ar_internal_metadata", primary_key: "key", force: :cascade do |t|
    t.string   "value",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
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

  create_table "jobs", force: :cascade do |t|
    t.integer  "user_id",     limit: 4
    t.string   "name",        limit: 255
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "state",       limit: 255
  end

  create_table "labor_costcs", force: :cascade do |t|
    t.integer  "costc_id",   limit: 4
    t.integer  "labor_id",   limit: 4
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

  create_table "operators", force: :cascade do |t|
    t.string   "cc",            limit: 255
    t.string   "name",          limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "lastname",      limit: 255
    t.datetime "dateadmission"
    t.string   "state",         limit: 255
    t.integer  "job_id",        limit: 4
  end

  create_table "sublots", force: :cascade do |t|
    t.string   "code",        limit: 255
    t.string   "name",        limit: 255
    t.integer  "user_id",     limit: 4
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "supervisors", force: :cascade do |t|
    t.integer  "user_id",       limit: 4
    t.string   "name",          limit: 255
    t.string   "lastname",      limit: 255
    t.float    "cc",            limit: 24
    t.string   "state",         limit: 255
    t.datetime "dateadmission"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "job_id",        limit: 4
  end

end
