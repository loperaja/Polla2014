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

ActiveRecord::Schema.define(version: 20140610082141) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "final_positions", force: true do |t|
    t.integer  "polla_id"
    t.integer  "team_id"
    t.integer  "position_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "final_positions", ["position_id", "polla_id", "team_id"], name: "index_final_positions_on_position_id_and_polla_id_and_team_id", unique: true, using: :btree

  create_table "group_positions", force: true do |t|
    t.integer  "polla_id"
    t.integer  "team_id"
    t.integer  "position_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "group_id"
  end

  create_table "groups", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "match_details", force: true do |t|
    t.integer  "match_id"
    t.integer  "team_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "match_details", ["match_id", "team_id"], name: "index_match_details_on_match_id_and_team_id", unique: true, using: :btree

  create_table "match_results", force: true do |t|
    t.integer  "polla_id"
    t.integer  "match_id"
    t.integer  "winner"
    t.boolean  "draw"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "matches", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "group_id"
  end

  create_table "pollas", force: true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.boolean  "paid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pollas", ["user_id"], name: "index_pollas_on_user_id", using: :btree

  create_table "positions", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "qualifieds", force: true do |t|
    t.integer  "polla_id"
    t.integer  "team_id"
    t.integer  "round_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "qualifieds", ["polla_id", "team_id", "round_id"], name: "index_qualifieds_on_polla_id_and_team_id_and_round_id", unique: true, using: :btree

  create_table "rounds", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "number_of_teams"
  end

  create_table "teams", force: true do |t|
    t.string   "name"
    t.integer  "group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "shortname"
  end

  create_table "user_comments", force: true do |t|
    t.integer  "user_id"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "surname"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

end
