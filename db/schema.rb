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

ActiveRecord::Schema.define(version: 20160111112223) do

  create_table "brands", force: :cascade do |t|
    t.string   "name"
    t.integer  "manufacturer_id"
    t.string   "image_url"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "brands", ["manufacturer_id"], name: "index_brands_on_manufacturer_id"

  create_table "manufacturers", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "manufacturers", ["name"], name: "index_manufacturers_on_name"

  create_table "modifications", force: :cascade do |t|
    t.integer  "brand_id"
    t.string   "model_motor"
    t.string   "name"
    t.integer  "power"
    t.decimal  "volume_motor",     precision: 5, scale: 2
    t.integer  "start_production"
    t.integer  "stop_production"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  add_index "modifications", ["brand_id"], name: "index_modifications_on_brand_id"

end
