class CreateShipments < ActiveRecord::Migration
  def change
    create_table :shipments do |t|
      t.references :shipping_request
      t.references :vehicle
      t.integer :coupled_vehicle_id
      t.integer :driver_id
      t.datetime :shipping_datetime
      t.integer :status, :limit => 1
      t.text :comments

      t.timestamps
    end
    add_index :shipments, :shipping_request_id
    add_index :shipments, :vehicle_id
  end
end
