class AddGroupToVehicleTypes < ActiveRecord::Migration
  def change
    add_column :vehicle_types, :group, :integer

  end
end
