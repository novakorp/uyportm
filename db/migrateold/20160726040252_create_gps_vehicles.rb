class CreateGpsVehicles < ActiveRecord::Migration
  def change
    create_table :gps_vehicles do |t|
      t.string :vehicle_id
      t.string :number_plate
      t.string :description

      t.timestamps
    end
  end
end
