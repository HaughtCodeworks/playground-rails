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

ActiveRecord::Schema.define(version: 20161024202721) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "items", force: :cascade do |t|
    t.string   "description"
    t.integer  "list_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["list_id"], name: "index_items_on_list_id", using: :btree
  end

  create_table "lists", force: :cascade do |t|
    t.string   "name"
    t.string   "slug"
    t.integer  "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id", "slug"], name: "index_lists_on_project_id_and_slug", unique: true, using: :btree
    t.index ["project_id"], name: "index_lists_on_project_id", using: :btree
  end

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.string   "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_projects_on_slug", unique: true, using: :btree
  end

  create_table "projects_users", id: false, force: :cascade do |t|
    t.integer "project_id", null: false
    t.integer "user_id",    null: false
    t.index ["project_id", "user_id"], name: "index_projects_users_on_project_id_and_user_id", using: :btree
    t.index ["user_id", "project_id"], name: "index_projects_users_on_user_id_and_project_id", using: :btree
  end

  create_table "statuses", force: :cascade do |t|
    t.string   "description"
    t.integer  "list_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["list_id"], name: "index_statuses_on_list_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "encrypted_password"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
  end

  add_foreign_key "items", "lists"
  add_foreign_key "lists", "projects"
  add_foreign_key "statuses", "lists"
end
