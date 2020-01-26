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

ActiveRecord::Schema.define(version: 20191030123953) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string   "account_number", limit: 255
    t.integer  "customer_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "description",    limit: 255
  end

  create_table "addresses", force: :cascade do |t|
    t.integer  "location_id"
    t.string   "description",      limit: 255
    t.string   "address_detail_1", limit: 255
    t.string   "address_detail_2", limit: 255
    t.string   "postal_code",      limit: 255
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "customer_id"
    t.string   "phone_number_1",   limit: 255
    t.string   "phone_number_2",   limit: 255
    t.text     "comments"
  end

  add_index "addresses", ["customer_id"], name: "index_addresses_on_customer_id", using: :btree
  add_index "addresses", ["location_id"], name: "index_addresses_on_location_id", using: :btree

  create_table "billing_units", force: :cascade do |t|
    t.string   "description", limit: 255
    t.string   "code",        limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "cargo_categories", force: :cascade do |t|
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "cargo_types", force: :cascade do |t|
    t.string   "description",       limit: 255
    t.integer  "cargo_category_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "measure_unit_id"
  end

  add_index "cargo_types", ["cargo_category_id"], name: "index_cargo_types_on_cargo_category_id", using: :btree
  add_index "cargo_types", ["measure_unit_id"], name: "index_addresses_on_measure_unit_id", using: :btree

  create_table "companies", force: :cascade do |t|
    t.string   "company_name", limit: 255
    t.string   "trade_name",   limit: 255
    t.string   "rut",          limit: 255
    t.string   "bps",          limit: 255
    t.string   "mtss",         limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "mtop",         limit: 255
  end

  create_table "customer_shipping_orders", force: :cascade do |t|
    t.integer  "company_id"
    t.integer  "order_number",   default: "nextval('order_number_seq'::regclass)"
    t.datetime "order_datetime"
    t.date     "shipping_date"
    t.text     "comments"
    t.datetime "created_at",                                                       null: false
    t.datetime "updated_at",                                                       null: false
    t.integer  "customer_id"
  end

  add_index "customer_shipping_orders", ["company_id"], name: "index_customer_shipping_orders_on_company_id", using: :btree
  add_index "customer_shipping_orders", ["customer_id"], name: "index_customer_shipping_orders_on_customer_id", using: :btree

  create_table "customers", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "rut",        limit: 255
  end

  create_table "document_types", force: :cascade do |t|
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string   "first_name",       limit: 255
    t.string   "last_name",        limit: 255
    t.string   "personal_id",      limit: 255
    t.string   "personal_id_type", limit: 255
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "company_id"
    t.integer  "job_type"
  end

  add_index "employees", ["company_id"], name: "index_employees_on_company_id", using: :btree

  create_table "gps_changes", force: :cascade do |t|
    t.integer  "gps_vehicle_id"
    t.integer  "gps_retired_vehicle_id"
    t.datetime "date_changed"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "gps_odometer_readings", force: :cascade do |t|
    t.datetime "gps_datetime"
    t.integer  "gps_partial_read"
    t.integer  "gps_total_read"
    t.integer  "vehicle_id"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.integer  "difference"
    t.string   "gps_numeric_ident",     limit: 255
    t.string   "gps_plate_number",      limit: 255
    t.string   "gps_descriptive_ident", limit: 255
    t.integer  "gps_vehicle_id"
  end

  create_table "gps_retired_vehicles", force: :cascade do |t|
    t.string   "gps_numeric_ident",       limit: 255
    t.string   "gps_plate_number",        limit: 255
    t.string   "gps_descriptive_ident",   limit: 255
    t.datetime "retirement_date"
    t.integer  "retirement_reason"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "original_gps_vehicle_id"
    t.integer  "vehicle_id"
    t.datetime "creation_date"
  end

  create_table "gps_vehicle_positions", force: :cascade do |t|
    t.decimal  "gps_longitude",                     precision: 7, scale: 5
    t.decimal  "gps_latitude",                      precision: 7, scale: 5
    t.datetime "created_at",                                                null: false
    t.datetime "updated_at",                                                null: false
    t.integer  "vehicle_id"
    t.string   "gps_numeric_ident",     limit: 255
    t.datetime "gps_datetime"
    t.string   "gps_descriptive_ident", limit: 255
    t.string   "gps_direction",         limit: 255
    t.string   "gps_speed",             limit: 255
    t.integer  "gps_vehicle_id"
  end

  add_index "gps_vehicle_positions", ["vehicle_id"], name: "index_vehicle_positions_on_vehicle_id", using: :btree

  create_table "gps_vehicles", force: :cascade do |t|
    t.string   "gps_numeric_ident",     limit: 255
    t.string   "gps_plate_number",      limit: 255
    t.string   "gps_descriptive_ident", limit: 255
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.integer  "vehicle_id"
    t.datetime "creation_date"
  end

  create_table "locations", force: :cascade do |t|
    t.string   "name",          limit: 255
    t.string   "coords",        limit: 255
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.integer  "state_id"
    t.integer  "location_type", limit: 2
    t.decimal  "longitude",                 precision: 7, scale: 5
    t.decimal  "latitude",                  precision: 7, scale: 5
  end

  add_index "locations", ["state_id"], name: "index_locations_on_state_id", using: :btree

  create_table "m_requested_cargos", force: :cascade do |t|
    t.integer  "amount"
    t.integer  "cargo_type_id"
    t.integer  "m_shipping_request_id"
    t.integer  "measure_unit_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "m_requested_cargos", ["cargo_type_id"], name: "index_m_requested_cargos_on_cargo_type_id", using: :btree
  add_index "m_requested_cargos", ["m_shipping_request_id"], name: "index_m_requested_cargos_on_m_shipping_request_id", using: :btree
  add_index "m_requested_cargos", ["measure_unit_id"], name: "index_m_requested_cargos_on_measure_unit_id", using: :btree

  create_table "m_requested_deliveries", force: :cascade do |t|
    t.integer  "amount"
    t.integer  "address_id"
    t.text     "comments"
    t.integer  "m_requested_cargo_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "m_requested_deliveries", ["address_id"], name: "index_m_requested_deliveries_on_address_id", using: :btree
  add_index "m_requested_deliveries", ["m_requested_cargo_id"], name: "index_m_requested_deliveries_on_requested_cargo_id", using: :btree

  create_table "m_requested_supplies", force: :cascade do |t|
    t.integer  "amount"
    t.integer  "address_id"
    t.text     "comments"
    t.integer  "m_requested_cargo_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "m_requested_supplies", ["address_id"], name: "index_m_requested_supplies_on_address_id", using: :btree
  add_index "m_requested_supplies", ["m_requested_cargo_id"], name: "index_m_requested_supplies_on_requested_cargo_id", using: :btree

  create_table "m_shipping_requests", force: :cascade do |t|
    t.string   "contact",         limit: 255
    t.string   "details",         limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "service_id"
    t.integer  "trip_id"
    t.string   "name",            limit: 255
    t.integer  "simple_shipment"
    t.integer  "customer_id"
  end

  add_index "m_shipping_requests", ["customer_id"], name: "index_m_shipping_requests_on_customer_id", using: :btree
  add_index "m_shipping_requests", ["service_id"], name: "index_m_shipping_requests_on_service_id", using: :btree
  add_index "m_shipping_requests", ["trip_id"], name: "index_m_shipping_requests_on_trip_id", using: :btree

  create_table "measure_units", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "symbol",     limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "retired_vehicles", force: :cascade do |t|
    t.string   "model",               limit: 255
    t.string   "plate_number",        limit: 255
    t.string   "comments",            limit: 255
    t.integer  "company_id"
    t.integer  "vehicle_type_id"
    t.integer  "vehicle_brand_id"
    t.datetime "retirement_date"
    t.integer  "retirement_reason"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "original_vehicle_id"
  end

  create_table "return_types", force: :cascade do |t|
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "services", force: :cascade do |t|
    t.string   "description",     limit: 255
    t.integer  "billing_unit_id"
    t.integer  "vehicle_type_id"
    t.integer  "couple_type_id"
    t.integer  "couple_required", limit: 2
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "company_id"
  end

  add_index "services", ["billing_unit_id"], name: "index_services_on_billing_unit_id", using: :btree
  add_index "services", ["company_id"], name: "index_services_on_company_id", using: :btree
  add_index "services", ["couple_type_id"], name: "index_services_on_couple_type_id", using: :btree
  add_index "services", ["vehicle_type_id"], name: "index_services_on_vehicle_type_id", using: :btree

  create_table "shipment_deliveries", force: :cascade do |t|
    t.integer  "amount"
    t.integer  "shipment_id"
    t.integer  "address_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "shipment_deliveries", ["address_id"], name: "index_shipment_deliveries_on_address_id", using: :btree
  add_index "shipment_deliveries", ["shipment_id"], name: "index_shipment_deliveries_on_shipment_id", using: :btree

  create_table "shipment_documents", force: :cascade do |t|
    t.integer  "shipment_id"
    t.integer  "document_type_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "number_text",      limit: 255
    t.text     "comments"
  end

  add_index "shipment_documents", ["document_type_id"], name: "index_shipment_documents_on_document_type_id", using: :btree
  add_index "shipment_documents", ["shipment_id"], name: "index_shipment_documents_on_shipment_id", using: :btree

  create_table "shipment_supplies", force: :cascade do |t|
    t.integer  "amount"
    t.integer  "shipment_id"
    t.integer  "address_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "shipment_supplies", ["address_id"], name: "index_shipment_supplies_on_address_id", using: :btree
  add_index "shipment_supplies", ["shipment_id"], name: "index_shipment_supplies_on_shipment_id", using: :btree

  create_table "shipments", force: :cascade do |t|
    t.integer  "shipping_request_id"
    t.integer  "vehicle_id"
    t.integer  "coupled_vehicle_id"
    t.integer  "driver_id"
    t.integer  "status",              limit: 2
    t.text     "comments"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.datetime "departure_time"
    t.datetime "arrival_time"
    t.integer  "schedule"
  end

  add_index "shipments", ["shipping_request_id"], name: "index_shipments_on_shipping_request_id", using: :btree
  add_index "shipments", ["vehicle_id"], name: "index_shipments_on_vehicle_id", using: :btree

  create_table "shipping_requests", force: :cascade do |t|
    t.integer  "customer_shipping_order_id"
    t.integer  "m_shipping_request_id"
    t.integer  "service_id"
    t.integer  "trip_quantity"
    t.integer  "cargo_quantity"
    t.integer  "trip_id"
    t.integer  "cargo_type_id"
    t.text     "comments"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "measure_unit_id"
    t.integer  "schedule"
  end

  add_index "shipping_requests", ["cargo_type_id"], name: "index_shipping_requests_on_cargo_type_id", using: :btree
  add_index "shipping_requests", ["customer_shipping_order_id"], name: "index_shipping_requests_on_customer_shipping_order_id", using: :btree
  add_index "shipping_requests", ["m_shipping_request_id"], name: "index_shipping_requests_on_m_shipping_request_id", using: :btree
  add_index "shipping_requests", ["measure_unit_id"], name: "index_shipping_requests_on_measure_unit_id", using: :btree
  add_index "shipping_requests", ["service_id"], name: "index_shipping_requests_on_service_id", using: :btree
  add_index "shipping_requests", ["trip_id"], name: "index_shipping_requests_on_trip_id", using: :btree

  create_table "simple_shippings", force: :cascade do |t|
    t.datetime "shipping_date"
    t.integer  "vehicle_id"
    t.integer  "coupled_vehicle_id"
    t.integer  "company_id"
    t.integer  "driver_id"
    t.string   "m_shipping_request_id", limit: 255
    t.decimal  "amount",                            precision: 8, scale: 2
    t.integer  "billing_unit_id"
    t.decimal  "unit_price",                        precision: 8, scale: 2
    t.text     "documents"
    t.integer  "return_type_id"
    t.text     "comments"
    t.string   "invoice_number",        limit: 255
    t.datetime "created_at",                                                null: false
    t.datetime "updated_at",                                                null: false
  end

  create_table "states", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "country",    limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "sucta_registrations", force: :cascade do |t|
    t.datetime "expiration"
    t.integer  "extended",   limit: 2
    t.text     "comments"
    t.integer  "vehicle_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "sucta_registrations", ["vehicle_id"], name: "index_sucta_registrations_on_vehicle_id", using: :btree

  create_table "trips", force: :cascade do |t|
    t.integer  "from_location_id"
    t.integer  "to_location_id"
    t.integer  "distance"
    t.string   "route_itinerary",  limit: 255
    t.string   "comments",         limit: 255
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "trips", ["from_location_id"], name: "index_trips_on_from_location_id", using: :btree
  add_index "trips", ["to_location_id"], name: "index_trips_on_to_location_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.string   "email",           limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "password_digest", limit: 255
    t.string   "remember_token",  limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

  create_table "vehicle_brands", force: :cascade do |t|
    t.string   "name",              limit: 255
    t.string   "country_of_origin", limit: 255
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "abbreviation",      limit: 255
  end

  create_table "vehicle_registrations", force: :cascade do |t|
    t.string   "chassis",             limit: 255
    t.string   "engine",              limit: 255
    t.datetime "registration_date"
    t.string   "registration_number", limit: 255
    t.string   "dnt_id",              limit: 255
    t.integer  "vehicle_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.datetime "date_of_entry"
  end

  add_index "vehicle_registrations", ["vehicle_id"], name: "index_vehicle_registrations_on_vehicle_id", using: :btree

  create_table "vehicle_types", force: :cascade do |t|
    t.string   "description",        limit: 255
    t.integer  "coupling_support",   limit: 2
    t.integer  "couples_to_type_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "type_group"
  end

  create_table "vehicles", force: :cascade do |t|
    t.string   "model",               limit: 255
    t.string   "plate_number",        limit: 255
    t.string   "comments",            limit: 255
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "company_id"
    t.integer  "vehicle_type_id"
    t.integer  "vehicle_brand_id"
    t.datetime "retirment_date"
    t.integer  "retirement_reason"
    t.text     "retirement_comments"
    t.integer  "status"
    t.integer  "default_driver_id"
    t.string   "gps_numeric_ident",   limit: 255
    t.datetime "creation_date"
  end

  add_index "vehicles", ["vehicle_brand_id"], name: "index_vehicles_on_vehicle_brand_id", using: :btree

end
