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

ActiveRecord::Schema.define(version: 20150306083125) do

  create_table "articles", force: :cascade do |t|
    t.string   "title",       limit: 20,    null: false
    t.text     "content",     limit: 65535
    t.integer  "category_id", limit: 4,     null: false
    t.integer  "user_id",     limit: 4,     null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "gallery_id",  limit: 4
    t.integer  "read_count",  limit: 4
  end

  add_index "articles", ["user_id", "category_id"], name: "index_articles_on_user_id_and_category_id", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "name",       limit: 20,             null: false
    t.integer  "user_id",    limit: 4,  default: 0, null: false
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  add_index "categories", ["user_id", "name"], name: "index_categories_on_user_id_and_name", unique: true, using: :btree

  create_table "comments", force: :cascade do |t|
    t.integer  "article_id", limit: 4,     null: false
    t.string   "email",      limit: 20,    null: false
    t.string   "subject",    limit: 20,    null: false
    t.text     "message",    limit: 65535, null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "comments", ["article_id"], name: "index_comments_on_article_id", using: :btree

  create_table "galleries", force: :cascade do |t|
    t.string   "image",      limit: 255, null: false
    t.string   "title",      limit: 255, null: false
    t.string   "alt",        limit: 255
    t.string   "user_id",    limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "user_name",       limit: 255,             null: false
    t.string   "email",           limit: 255,             null: false
    t.integer  "admin",           limit: 1,   default: 0, null: false
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.string   "password_digest", limit: 255
    t.string   "remember_token",  limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", unique: true, using: :btree

end
