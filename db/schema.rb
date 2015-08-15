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

ActiveRecord::Schema.define(version: 0) do

  create_table "blogs", force: true do |t|
    t.text    "name"
    t.integer "user_id"
    t.text    "description"
  end

  add_index "blogs", ["user_id"], name: "index_blogs_on_user_id"

  create_table "comments", force: true do |t|
    t.string  "title"
    t.text    "text"
    t.integer "post_id"
    t.integer "user_id"
  end

  add_index "comments", ["post_id"], name: "index_comments_on_post_id"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "follows", force: true do |t|
    t.integer "blog_id"
    t.integer "user_id"
  end

  add_index "follows", ["blog_id"], name: "index_follows_on_blog_id"
  add_index "follows", ["user_id"], name: "index_follows_on_user_id"

  create_table "posts", force: true do |t|
    t.string  "title"
    t.text    "text"
    t.integer "blog_id"
  end

  add_index "posts", ["blog_id"], name: "index_posts_on_blog_id"

  create_table "users", force: true do |t|
    t.string "username"
    t.string "email"
    t.date   "birthdate",       limit: 255
    t.string "sex"
    t.string "password_digest"
  end

end
