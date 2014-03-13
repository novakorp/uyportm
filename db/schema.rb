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

ActiveRecord::Schema.define(:version => 20140313030447) do

  create_table "locations", :force => true do |t|
    t.string   "name"
    t.string   "coords"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "trips", :force => true do |t|
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "from_location_id"
    t.integer  "to_location_id"
    t.integer  "distance"
  end

  add_index "trips", ["from_location_id"], :name => "index_trips_on_from_location_id"
  add_index "trips", ["to_location_id"], :name => "index_trips_on_to_location_id"

  create_table "vehicles", :force => true do |t|
    t.string   "brand"
    t.string   "model"
    t.string   "number_plate"
    t.string   "comments"
    t.string   "text"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

end
