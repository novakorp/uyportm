class RecreateIndexes < ActiveRecord::Migration
  def change
  
	add_index "services", ["billing_unit_id"], :name => "index_services_on_billing_unit_id"
	add_index "services", ["vehicle_type_id"], :name => "index_services_on_vehicle_type_id"
	add_index "services", ["couple_type_id"], :name => "index_services_on_couple_type_id"
	
	
	remove_index "addresses",  :name => "index_shipping_addresses_on_location_id"  
	add_index "addresses", ["location_id"], :name => "index_addresses_on_location_id"
   
  

  remove_index "journeys",  :name => "index_trips_on_from_location_id"
  remove_index "journeys", :name => "index_trips_on_to_location_id"
  
  add_index "journeys", ["from_location_id"], :name => "index_journeys_on_from_location_id"
  add_index "journeys", ["to_location_id"], :name => "index_journeys_on_to_location_id"
  
  end	
end
