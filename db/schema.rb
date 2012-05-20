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

ActiveRecord::Schema.define(:version => 20120520011322) do

  create_table "card_records", :force => true do |t|
    t.integer  "user_id"
    t.integer  "card_id"
    t.integer  "seen_count",   :default => 0
    t.integer  "wrong_count",  :default => 0
    t.integer  "right_count",  :default => 0
    t.integer  "bucket",       :default => 0
    t.boolean  "active",       :default => false
    t.datetime "last_seen_at"
  end

  add_index "card_records", ["user_id", "card_id"], :name => "index_card_records_on_user_id_and_card_id", :unique => true
  add_index "card_records", ["user_id"], :name => "index_card_records_on_user_id"

  create_table "cards", :force => true do |t|
    t.text    "front"
    t.text    "back"
    t.integer "deck_id"
  end

  add_index "cards", ["deck_id"], :name => "index_cards_on_deck_id"

  create_table "decks", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "encrypted_password", :limit => 128
    t.string   "salt",               :limit => 128
    t.string   "confirmation_token", :limit => 128
    t.string   "remember_token",     :limit => 128
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email"
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
