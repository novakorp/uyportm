class AddGpsDirectionToGpsVehiclePositions < ActiveRecord::Migration
  def change
    add_column :gps_vehicle_positions, :gps_direction, :string

  end
end
