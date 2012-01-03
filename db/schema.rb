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

ActiveRecord::Schema.define(:version => 20120102171833) do

  create_table "invitations", :force => true do |t|
    t.integer  "user_id"
    t.integer  "project_id"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "invitations", ["project_id"], :name => "index_invitations_on_project_id"
  add_index "invitations", ["user_id"], :name => "index_invitations_on_user_id"

  create_table "memberships", :force => true do |t|
    t.integer  "project_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "memberships", ["project_id"], :name => "index_memberships_on_project_id"
  add_index "memberships", ["user_id"], :name => "index_memberships_on_user_id"

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "statuses", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "story_sizes", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_stories", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "position"
    t.integer  "project_id"
    t.integer  "status_id"
    t.integer  "story_size_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_stories", ["project_id"], :name => "index_user_stories_on_project_id"
  add_index "user_stories", ["status_id"], :name => "index_user_stories_on_status_id"
  add_index "user_stories", ["story_size_id"], :name => "index_user_stories_on_story_size_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email",                           :null => false
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.string   "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
  end

  add_index "users", ["remember_me_token"], :name => "index_users_on_remember_me_token"
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token"

end
