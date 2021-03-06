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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20131013213704) do

  create_table "api_keys", :force => true do |t|
    t.string   "access_token"
    t.integer  "user_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "api_keys", ["access_token"], :name => "index_api_keys_on_access_token", :unique => true

  create_table "apps", :force => true do |t|
    t.string   "api_key"
    t.integer  "user_id"
    t.string   "name"
    t.string   "url"
    t.boolean  "verified"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "delayed_jobs", :force => true do |t|
    t.integer  "priority",   :default => 0
    t.integer  "attempts",   :default => 0
    t.text     "handler"
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "delayed_jobs", ["priority", "run_at"], :name => "delayed_jobs_priority"

  create_table "tasks", :force => true do |t|
    t.string   "url"
    t.datetime "exec_time"
    t.boolean  "executed"
    t.string   "app_token"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "method"
    t.integer  "dj_id"
  end

  create_table "tests", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "f_name"
    t.string   "l_name"
    t.string   "phone"
    t.string   "password_digest"
    t.string   "auth_token"
    t.string   "password_reset_token"
    t.datetime "password_reset_at"
    t.string   "verification_token"
    t.boolean  "verified"
    t.string   "last_4_digits"
    t.string   "stripe_id"
    t.boolean  "admin"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["verification_token"], :name => "index_users_on_verification_token"

end
