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

ActiveRecord::Schema.define(:version => 20151023024325) do

  create_table "accounts", :force => true do |t|
    t.string   "account_number"
    t.integer  "customer_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.string   "description"
  end

  create_table "addresses", :force => true do |t|
    t.integer  "location_id"
    t.string   "description"
    t.string   "address_detail_1"
    t.string   "address_detail_2"
    t.string   "postal_code"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "customer_id"
    t.string   "phone_number_1"
    t.string   "phone_number_2"
    t.text     "comments"
  end

  add_index "addresses", ["customer_id"], :name => "index_addresses_on_customer_id"
  add_index "addresses", ["location_id"], :name => "index_addresses_on_location_id"

  create_table "billing_units", :force => true do |t|
    t.string   "description"
    t.string   "code"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "cargo_categories", :force => true do |t|
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "cargo_types", :force => true do |t|
    t.string   "description"
    t.integer  "cargo_category_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.integer  "measure_unit_id"
  end

  add_index "cargo_types", ["cargo_category_id"], :name => "index_cargo_types_on_cargo_category_id"
  add_index "cargo_types", ["measure_unit_id"], :name => "index_addresses_on_measure_unit_id"

  create_table "companies", :force => true do |t|
    t.string   "company_name"
    t.string   "trade_name"
    t.string   "rut"
    t.string   "bps"
    t.string   "mtss"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "mtop"
  end

  create_table "customer_shipping_orders", :force => true do |t|
    t.integer  "company_id"
    t.integer  "order_number"
    t.datetime "order_datetime"
    t.date     "shipping_date"
    t.text     "comments"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "customer_id"
  end

  add_index "customer_shipping_orders", ["company_id"], :name => "index_customer_shipping_orders_on_company_id"
  add_index "customer_shipping_orders", ["customer_id"], :name => "index_customer_shipping_orders_on_customer_id"

  create_table "customers", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "rut"
  end

  create_table "document_types", :force => true do |t|
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "employees", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "personal_id"
    t.string   "personal_id_type"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "company_id"
  end

  add_index "employees", ["company_id"], :name => "index_employees_on_company_id"

  create_table "locations", :force => true do |t|
    t.string   "name"
    t.string   "coords"
    t.datetime "created_at",                                               :null => false
    t.datetime "updated_at",                                               :null => false
    t.integer  "state_id"
    t.integer  "location_type", :limit => 2
    t.decimal  "longitude",                  :precision => 7, :scale => 5
    t.decimal  "latitude",                   :precision => 7, :scale => 5
  end

  add_index "locations", ["state_id"], :name => "index_locations_on_state_id"

  create_table "m_requested_cargos", :force => true do |t|
    t.integer  "amount"
    t.integer  "cargo_type_id"
    t.integer  "m_shipping_request_id"
    t.integer  "measure_unit_id"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  add_index "m_requested_cargos", ["cargo_type_id"], :name => "index_m_requested_cargos_on_cargo_type_id"
  add_index "m_requested_cargos", ["m_shipping_request_id"], :name => "index_m_requested_cargos_on_m_shipping_request_id"
  add_index "m_requested_cargos", ["measure_unit_id"], :name => "index_m_requested_cargos_on_measure_unit_id"

  create_table "m_requested_deliveries", :force => true do |t|
    t.integer  "amount"
    t.integer  "address_id"
    t.text     "comments"
    t.integer  "m_requested_cargo_id"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  add_index "m_requested_deliveries", ["address_id"], :name => "index_m_requested_deliveries_on_address_id"
  add_index "m_requested_deliveries", ["m_requested_cargo_id"], :name => "index_m_requested_deliveries_on_requested_cargo_id"

  create_table "m_requested_supplies", :force => true do |t|
    t.integer  "amount"
    t.integer  "address_id"
    t.text     "comments"
    t.integer  "m_requested_cargo_id"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  add_index "m_requested_supplies", ["address_id"], :name => "index_m_requested_supplies_on_address_id"
  add_index "m_requested_supplies", ["m_requested_cargo_id"], :name => "index_m_requested_supplies_on_requested_cargo_id"

  create_table "m_shipping_requests", :force => true do |t|
    t.string   "contact"
    t.string   "details"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "service_id"
    t.integer  "trip_id"
    t.string   "name"
    t.integer  "simple_shipment"
    t.integer  "customer_id"
  end

  add_index "m_shipping_requests", ["customer_id"], :name => "index_m_shipping_requests_on_customer_id"
  add_index "m_shipping_requests", ["service_id"], :name => "index_m_shipping_requests_on_service_id"
  add_index "m_shipping_requests", ["trip_id"], :name => "index_m_shipping_requests_on_trip_id"

  create_table "measure_units", :force => true do |t|
    t.string   "name"
    t.string   "symbol"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "services", :force => true do |t|
    t.string   "description"
    t.integer  "billing_unit_id"
    t.integer  "vehicle_type_id"
    t.integer  "couple_type_id"
    t.integer  "couple_required", :limit => 2
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
    t.integer  "company_id"
  end

  add_index "services", ["billing_unit_id"], :name => "index_services_on_billing_unit_id"
  add_index "services", ["company_id"], :name => "index_services_on_company_id"
  add_index "services", ["couple_type_id"], :name => "index_services_on_couple_type_id"
  add_index "services", ["vehicle_type_id"], :name => "index_services_on_vehicle_type_id"

  create_table "shipment_deliveries", :force => true do |t|
    t.integer  "amount"
    t.integer  "shipment_id"
    t.integer  "address_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "shipment_deliveries", ["address_id"], :name => "index_shipment_deliveries_on_address_id"
  add_index "shipment_deliveries", ["shipment_id"], :name => "index_shipment_deliveries_on_shipment_id"

  create_table "shipment_documents", :force => true do |t|
    t.integer  "shipment_id"
    t.integer  "document_type_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "number_text"
    t.text     "comments"
  end

  add_index "shipment_documents", ["document_type_id"], :name => "index_shipment_documents_on_document_type_id"
  add_index "shipment_documents", ["shipment_id"], :name => "index_shipment_documents_on_shipment_id"

  create_table "shipment_supplies", :force => true do |t|
    t.integer  "amount"
    t.integer  "shipment_id"
    t.integer  "address_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "shipment_supplies", ["address_id"], :name => "index_shipment_supplies_on_address_id"
  add_index "shipment_supplies", ["shipment_id"], :name => "index_shipment_supplies_on_shipment_id"

  create_table "shipments", :force => true do |t|
    t.integer  "shipping_request_id"
    t.integer  "vehicle_id"
    t.integer  "coupled_vehicle_id"
    t.integer  "driver_id"
    t.integer  "status",              :limit => 2
    t.text     "comments"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
    t.datetime "departure_time"
    t.datetime "arrival_time"
  end

  add_index "shipments", ["shipping_request_id"], :name => "index_shipments_on_shipping_request_id"
  add_index "shipments", ["vehicle_id"], :name => "index_shipments_on_vehicle_id"

  create_table "shipping_requests", :force => true do |t|
    t.integer  "customer_shipping_order_id"
    t.integer  "m_shipping_request_id"
    t.integer  "service_id"
    t.integer  "trip_quantity"
    t.integer  "cargo_quantity"
    t.integer  "trip_id"
    t.integer  "cargo_type_id"
    t.text     "comments"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
    t.integer  "measure_unit_id"
  end

  add_index "shipping_requests", ["cargo_type_id"], :name => "index_shipping_requests_on_cargo_type_id"
  add_index "shipping_requests", ["customer_shipping_order_id"], :name => "index_shipping_requests_on_customer_shipping_order_id"
  add_index "shipping_requests", ["m_shipping_request_id"], :name => "index_shipping_requests_on_m_shipping_request_id"
  add_index "shipping_requests", ["measure_unit_id"], :name => "index_shipping_requests_on_measure_unit_id"
  add_index "shipping_requests", ["service_id"], :name => "index_shipping_requests_on_service_id"
  add_index "shipping_requests", ["trip_id"], :name => "index_shipping_requests_on_trip_id"

  create_table "states", :force => true do |t|
    t.string   "name"
    t.string   "country"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "sucta_registrations", :force => true do |t|
    t.datetime "expiration"
    t.integer  "extended",   :limit => 2
    t.text     "comments"
    t.integer  "vehicle_id"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  add_index "sucta_registrations", ["vehicle_id"], :name => "index_sucta_registrations_on_vehicle_id"

  create_table "trips", :force => true do |t|
    t.integer  "from_location_id"
    t.integer  "to_location_id"
    t.integer  "distance"
    t.string   "route_itinerary"
    t.string   "comments"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "trips", ["from_location_id"], :name => "index_trips_on_from_location_id"
  add_index "trips", ["to_location_id"], :name => "index_trips_on_to_location_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "password_digest"
    t.string   "remember_token"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

  create_table "vehicle_brands", :force => true do |t|
    t.string   "name"
    t.string   "country_of_origin"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.string   "abbreviation"
  end

  create_table "vehicle_odometer_readings", :force => true do |t|
    t.datetime "gps_datetime"
    t.integer  "gps_partial_read"
    t.integer  "gps_total_read"
    t.string   "gps_vehicle_id"
    t.integer  "vehicle_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "difference"
  end

  add_index "vehicle_odometer_readings", ["vehicle_id"], :name => "index_vehicle_odometer_readings_on_vehicle_id"

  create_table "vehicle_positions", :force => true do |t|
    t.decimal  "longitude",  :precision => 7, :scale => 5
    t.decimal  "latitude",   :precision => 7, :scale => 5
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
    t.integer  "vehicle_id"
  end

  add_index "vehicle_positions", ["vehicle_id"], :name => "index_vehicle_positions_on_vehicle_id"

  create_table "vehicle_registrations", :force => true do |t|
    t.string   "chassis"
    t.string   "engine"
    t.datetime "registration_date"
    t.string   "registration_number"
    t.string   "dnt_id"
    t.integer  "vehicle_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.datetime "date_of_entry"
  end

  add_index "vehicle_registrations", ["vehicle_id"], :name => "index_vehicle_registrations_on_vehicle_id"

  create_table "vehicle_types", :force => true do |t|
    t.string   "description"
    t.integer  "coupling_support",   :limit => 2
    t.integer  "couples_to_type_id"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  create_table "vehicles", :force => true do |t|
    t.string   "brand"
    t.string   "model"
    t.string   "number_plate"
    t.string   "comments"
    t.string   "text"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "company_id"
    t.integer  "vehicle_type_id"
    t.integer  "vehicle_brand_id"
    t.string   "gps_vehicle_id"
    t.string   "gps_description"
    t.string   "gps_number_plate"
  end

  add_index "vehicles", ["vehicle_brand_id"], :name => "index_vehicles_on_vehicle_brand_id"

end
