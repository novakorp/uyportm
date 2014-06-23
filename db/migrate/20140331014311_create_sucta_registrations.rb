class CreateSuctaRegistrations < ActiveRecord::Migration
  def change
    create_table :sucta_registrations do |t|
      t.datetime :expiration
      t.integer :extended , :limit => 1 
      t.text :comments
      t.references :vehicle

      t.timestamps
    end
    add_index :sucta_registrations, :vehicle_id
  end
end
