class AddGpsDatetimeToGpsVehiclePositions < ActiveRecord::Migration
  def change
    add_column :gps_vehicle_positions, :gps_datetime, :datetime

  end
end
