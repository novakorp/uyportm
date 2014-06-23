class ChangeVehicleType < ActiveRecord::Migration
  def change
	 change_table :vehicle_types do |t|
	  t.rename :couple_type_id, :couples_to_type_id
	end
  end

end
