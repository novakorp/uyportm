class CreateGpsVehicles < ActiveRecord::Migration
  def change
    create_table :gps_vehicles do |t|
      t.string :gps_vehicle_id
      t.string :gps_plate_number
      t.string :gps_identifier

      t.timestamps
    end
  end
end
