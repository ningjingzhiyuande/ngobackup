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

ActiveRecord::Schema.define(:version => 20130705094332) do

  create_table "assets", :force => true do |t|
    t.integer  "item_id"
    t.string   "item_type"
    t.string   "avatar"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "blogs", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "category_id"
    t.integer  "user_id"
    t.boolean  "is_top"
    t.integer  "status"
    t.string   "cover"
    t.string   "tags"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "cases", :force => true do |t|
    t.string   "name"
    t.string   "url"
    t.text     "info"
    t.string   "min_image"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "ckeditor_assets", :force => true do |t|
    t.string   "data_file_name",                  :null => false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    :limit => 30
    t.string   "type",              :limit => 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], :name => "idx_ckeditor_assetable"
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], :name => "idx_ckeditor_assetable_type"

  create_table "ngos", :force => true do |t|
    t.string   "name"
    t.text     "info"
    t.string   "url"
    t.integer  "position"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "posts", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.text     "content"
    t.integer  "item_id"
    t.string   "item_type"
    t.integer  "status"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "rich_texts", :force => true do |t|
    t.integer  "user_id"
    t.string   "token"
    t.integer  "status",     :default => 0
    t.text     "content"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",               :default => ""
    t.string   "nickname"
    t.string   "name"
    t.string   "provider"
    t.string   "uid"
    t.string   "avatar"
    t.string   "access_token"
    t.string   "access_token_secret"
    t.string   "encrypted_password",  :default => ""
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

end
