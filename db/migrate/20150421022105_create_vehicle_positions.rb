class CreateVehiclePositions < ActiveRecord::Migration
  def change
    create_table :vehicle_positions do |t|
      t.string :gps_id_str
      t.decimal :longitude, :precision => 7, :scale => 5
      t.decimal :latitude, :precision => 7, :scale => 5
      
      t.timestamps
    end
  end
end
