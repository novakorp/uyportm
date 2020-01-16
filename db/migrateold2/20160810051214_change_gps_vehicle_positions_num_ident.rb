class ChangeGpsVehiclePositionsNumIdent < ActiveRecord::Migration
  def up
    remove_column :gps_vehicle_positions, :gps_numeric_ident
    add_column :gps_vehicle_positions, :gps_numeric_ident, :string
  end

  def down
  end
end
