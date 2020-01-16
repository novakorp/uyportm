class CreateVehicleOdometerReadings < ActiveRecord::Migration
  def change
    create_table :vehicle_odometer_readings do |t|
      t.datetime :gps_datetime
      t.integer :partial_reading
      t.integer :total_reading
      t.string :gps_id_str
      t.references :vehicle

      t.timestamps
    end
    add_index :vehicle_odometer_readings, :vehicle_id
  end
end
