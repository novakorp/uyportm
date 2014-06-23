class AddVehicleTypeToWorkTypes < ActiveRecord::Migration
  def change
    add_column :work_types, :vehicle_type_id, :integer

  end
end
