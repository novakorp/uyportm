class CreateVehicleRegistrations < ActiveRecord::Migration
  def change
    create_table :vehicle_registrations do |t|
      t.string :chassis
      t.string :engine
      t.datetime :registration_date
      t.string :registration_number
      t.string :dnt_id
      t.references :vehicle

      t.timestamps
    end
    add_index :vehicle_registrations, :vehicle_id
  end
end
