class AddGpsDescriptiveIdentToGpsVehiclePositions < ActiveRecord::Migration
  def change
    add_column :gps_vehicle_positions, :gps_descriptive_ident, :string

  end
end
