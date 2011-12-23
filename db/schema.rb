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

ActiveRecord::Schema.define(:version => 20111223155345) do

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

  create_table "story_points", :force => true do |t|
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_stories", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "position"
    t.integer  "project_id"
    t.integer  "status_id",      :default => 1
    t.integer  "story_point_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_stories", ["project_id"], :name => "index_user_stories_on_project_id"
  add_index "user_stories", ["status_id"], :name => "index_user_stories_on_status_id"
  add_index "user_stories", ["story_point_id"], :name => "index_user_stories_on_story_point_id"

end
