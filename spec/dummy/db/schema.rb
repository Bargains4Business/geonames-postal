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

ActiveRecord::Schema.define(version: 20170129234456) do

  create_table "geo_names_geo_names", force: :cascade do |t|
    t.string   "country_code",   limit: 255
    t.string   "postal_code",    limit: 255
    t.string   "place_name",     limit: 255
    t.string   "admin_name1",    limit: 255
    t.string   "admin_code1",    limit: 255
    t.string   "admin_name2",    limit: 255
    t.string   "admin_code2",    limit: 255
    t.string   "admin_name3",    limit: 255
    t.string   "admin_code3",    limit: 255
    t.string   "latitude",       limit: 255
    t.string   "longitude",      limit: 255
    t.integer  "accuracy",       limit: 4
    t.string   "country_alpha3", limit: 255
    t.string   "country_name",   limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "geo_names_geo_names", ["country_alpha3"], name: "index_geo_names_geo_names_on_country_alpha3", using: :btree
  add_index "geo_names_geo_names", ["country_code"], name: "index_geo_names_geo_names_on_country_code", using: :btree
  add_index "geo_names_geo_names", ["country_name"], name: "index_geo_names_geo_names_on_country_name", using: :btree
  add_index "geo_names_geo_names", ["postal_code"], name: "index_geo_names_geo_names_on_postal_code", using: :btree

end
