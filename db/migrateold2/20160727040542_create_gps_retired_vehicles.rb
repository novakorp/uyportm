class CreateGpsRetiredVehicles < ActiveRecord::Migration
  def change
    create_table :gps_retired_vehicles do |t|
      t.string :gps_vehicle_id
      t.string :gps_plate_number
      t.string :gps_identifier
      t.datetime :retirement_date
      t.integer :retirement_reason

      t.timestamps
    end
  end
end
