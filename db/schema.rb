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

ActiveRecord::Schema.define(:version => 8) do

  create_table "entries", :force => true do |t|
    t.text     "text"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "user_id"
    t.string   "game_id"
    t.string   "round_id"
  end

  create_table "games", :force => true do |t|
    t.integer_array "user_array"
    t.datetime      "created_at", :null => false
    t.datetime      "updated_at", :null => false
  end

  create_table "rounds", :force => true do |t|
    t.integer  "winner_id"
    t.integer  "chooser_id"
    t.text     "topic"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "game_id"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_hash"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

end
