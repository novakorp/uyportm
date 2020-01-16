class AddGpsNumericIdentToGpsVehiclePositions < ActiveRecord::Migration
  def change
    add_column :gps_vehicle_positions, :gps_numeric_ident, :integer

  end
end
