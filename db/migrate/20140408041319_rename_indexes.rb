class RenameIndexes < ActiveRecord::Migration
  def change
	rename_index :journeys, :index_trips_on_from_location_id, :index_journeys_on_from_location_id
	rename_index :journeys, :index_trips_on_to_location_id, :index_journeys_on_to_location_id
	
	rename_index :services, :index_job_types_on_billing_unit_id, :index_services_on_billing_unit_id
	rename_index :services, :index_job_types_on_vehicle_type_id, :index_services_on_vehicle_type_id
	
  end
end
