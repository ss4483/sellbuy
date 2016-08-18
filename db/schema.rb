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

ActiveRecord::Schema.define(version: 20160816140752) do

  create_table "fleas", force: :cascade do |t|
    t.string   "kind"
    t.string   "title"
    t.datetime "term_start"
    t.datetime "term_end"
    t.datetime "sel_term_start"
    t.datetime "sel_term_end"
    t.string   "address"
    t.string   "address2"
    t.string   "post"
    t.string   "supervision"
    t.string   "condition"
    t.string   "enter_link"
    t.string   "sel_item"
    t.string   "image_url",      default: ""
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "post_likes", force: :cascade do |t|
    t.integer  "post_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "post_replies", force: :cascade do |t|
    t.string   "title"
    t.string   "content"
    t.integer  "post_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.text     "kind"
    t.boolean  "index_check", default: true
    t.text     "content"
    t.string   "image_url",   default: ""
    t.datetime "term_end"
    t.string   "banner"
    t.integer  "other_user"
    t.string   "rating"
    t.integer  "user_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "service_replies", force: :cascade do |t|
    t.string   "content"
    t.integer  "service_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "services", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.boolean  "public_check"
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "user_likes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "favorite_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "kind"
    t.string   "name"
    t.string   "nickname"
    t.string   "profile"
    t.string   "phone_num"
    t.string   "gender"
    t.string   "location"
    t.string   "career"
    t.string   "category"
    t.string   "facebook_url"
    t.string   "instar_url"
    t.string   "twitter_url"
    t.string   "blog_url"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
