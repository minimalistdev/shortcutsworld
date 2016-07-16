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

ActiveRecord::Schema.define(version: 20160713024231) do

  create_table "apps", force: :cascade do |t|
    t.integer  "so_id"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "img"
  end

  add_index "apps", ["so_id"], name: "index_apps_on_so_id"

  create_table "keys_shortcuts", id: false, force: :cascade do |t|
    t.integer "shortcut_id", null: false
    t.integer "key_id",      null: false
  end

  add_index "keys_shortcuts", ["key_id", "shortcut_id"], name: "index_keys_shortcuts_on_key_id_and_shortcut_id"
  add_index "keys_shortcuts", ["shortcut_id", "key_id"], name: "index_keys_shortcuts_on_shortcut_id_and_key_id"

  create_table "shortcuts", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "app_id"
    t.text     "shortcut"
  end

  add_index "shortcuts", ["app_id"], name: "index_shortcuts_on_app_id"

  create_table "sos", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "img"
  end

end
