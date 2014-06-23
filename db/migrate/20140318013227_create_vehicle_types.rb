class CreateVehicleTypes < ActiveRecord::Migration
  def change
    create_table :vehicle_types do |t|
      t.string :description
      t.integer :coupling_support, :limit => 1
      t.integer :couple_type_id

      t.timestamps
    end
  end
end
