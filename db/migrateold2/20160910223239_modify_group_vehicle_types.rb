class ModifyGroupVehicleTypes < ActiveRecord::Migration
  def up
    rename_column :vehicle_types, :group, :type_group
  end

  def down
  end
end
