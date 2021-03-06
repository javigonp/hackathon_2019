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

ActiveRecord::Schema.define(version: 20191024185557) do

  create_table "areas", force: :cascade do |t|
    t.string   "picture"
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "chapters", force: :cascade do |t|
    t.string   "name"
    t.string   "picture_url"
    t.integer  "chapter_lead_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "feedbacks", force: :cascade do |t|
    t.text     "text",        null: false
    t.integer  "sender_id",   null: false
    t.integer  "receiver_id", null: false
    t.integer  "rating"
    t.integer  "category"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "squads", force: :cascade do |t|
    t.string   "name"
    t.integer  "scrum_master_id"
    t.integer  "product_owner_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "picture_url"
  end

  create_table "user_squad_history", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.integer  "squad_id",   null: false
    t.datetime "date_from"
    t.datetime "date_to"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                                                                                                                                          null: false
    t.string   "first_name",                                                                                                                                     null: false
    t.string   "last_name",                                                                                                                                      null: false
    t.string   "location"
    t.integer  "position"
    t.string   "slack_id"
    t.datetime "created_at",                                                                                                                                     null: false
    t.datetime "updated_at",                                                                                                                                     null: false
    t.integer  "current_squad_id"
    t.string   "picture_url"
    t.string   "slack_handle"
    t.integer  "chapter_id",       default: 1
    t.string   "slack_name"
    t.integer  "leader_id"
    t.string   "flag_url",         default: "https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/240/google/223/flag-for-uruguay_1f1fa-1f1fe.png"
  end

end
