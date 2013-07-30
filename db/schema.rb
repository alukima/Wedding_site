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

ActiveRecord::Schema.define(version: 20130729233804) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "campaigns", force: true do |t|
    t.string   "title"
    t.datetime "expiration_date"
    t.string   "ct_campaign_id"
    t.string   "image_file_name"
    t.text     "note"
    t.integer  "tilt_amount",     default: 1, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payments", force: true do |t|
    t.string   "ct_payment_id"
    t.string   "status"
    t.integer  "amount"
    t.string   "fullname"
    t.string   "email"
    t.string   "card_type"
    t.string   "card_last_four"
    t.string   "card_expiration_month"
    t.string   "card_expiration_year"
    t.integer  "campaign_id"
    t.string   "address_one"
    t.string   "address_two"
    t.string   "city"
    t.string   "state"
    t.string   "postal_code"
    t.string   "country"
    t.integer  "quantity"
    t.text     "additional_info"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "registrations", force: true do |t|
    t.string "name"
    t.string "url"
  end

  create_table "users", force: true do |t|
    t.string   "email",                           null: false
    t.string   "password_digest",                 null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.boolean  "is_admin",        default: false
    t.integer  "host_id"
    t.string   "ct_id"
  end

  create_table "weddings", force: true do |t|
    t.string   "name"
    t.string   "tag_line"
    t.datetime "date"
    t.string   "venue_name"
    t.string   "venue_photo"
    t.text     "directions"
    t.text     "about_us"
    t.text     "general_info"
    t.text     "about_him"
    t.text     "about_her"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.integer  "zip_code"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "groom_name"
    t.string   "bride_name"
    t.string   "couple_name"
  end

end
