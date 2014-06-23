class Dropindex < ActiveRecord::Migration
  def change
	remove_index "services",  :name => "index_job_types_on_billing_unit_id"
	remove_index "services", :name => "index_job_types_on_vehicle_type_id"
  end
end
