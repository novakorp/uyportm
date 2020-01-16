class CreateGpsOdometerReadings < ActiveRecord::Migration
  def change
    create_table :gps_odometer_readings do |t|
      t.datetime :gps_datetime
      t.integer :gps_partial_read
      t.integer :gps_total_read
      t.string :gps_vehicle_id
      t.integer :vehicle_id

      t.timestamps
    end
  end
end
