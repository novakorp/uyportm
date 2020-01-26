class CreateGpsChanges < ActiveRecord::Migration
  def change
    create_table :gps_changes do |t|
      t.integer :gps_vehicle_id
      t.integer :gps_retired_vehicle_id
      t.datetime :date_changed

      t.timestamps
    end
  end
end
