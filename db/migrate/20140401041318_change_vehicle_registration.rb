class ChangeVehicleRegistration < ActiveRecord::Migration
  def up
	 change_table :vehicle_registrations do |t|
	  t.remove :mtop_number
	  t.datetime :date_of_entry
	  end
  end

  def down
  end
end
