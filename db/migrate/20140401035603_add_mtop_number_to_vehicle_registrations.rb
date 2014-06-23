class AddMtopNumberToVehicleRegistrations < ActiveRecord::Migration
  def change
    add_column :vehicle_registrations, :mtop_number, :string

  end
end
