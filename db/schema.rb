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

ActiveRecord::Schema.define(version: 20150903233034) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  # create_table "collaborators", force: :cascade do |t|
  #   t.integer "wiki_id"
  #   t.integer "user_id"
  # end

  # add_index "collaborators", ["id"], name: "index_collaborators_on_id", unique: true, using: :btree
  # add_index "collaborators", ["user_id"], name: "index_collaborators_on_user_id", using: :btree
  # add_index "collaborators", ["wiki_id"], name: "index_collaborators_on_wiki_id", using: :btree

  create_table "plans", force: :cascade do |t|
    t.string   "name"
    t.decimal  "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
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
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider"
    t.string   "uid"
    t.string   "image"
    t.string   "role"
    t.integer  "plan_id"
    t.string   "stripe_id"
    t.string   "subscription_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "users_wikis", id: false, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "wiki_id", null: false
  end

  add_index "users_wikis", ["user_id", "wiki_id"], name: "index_users_wikis_on_user_id_and_wiki_id", unique: true, using: :btree
  add_index "users_wikis", ["wiki_id", "user_id"], name: "index_users_wikis_on_wiki_id_and_user_id", unique: true, using: :btree

  create_table "wikis", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.boolean  "private"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "creator"
  end

end
