class CreateRetiredVehicles < ActiveRecord::Migration
  def change
    create_table :retired_vehicles do |t|
      t.string :model
      t.string :plate_number
      t.string :comments
      t.integer :company_id
      t.integer :vehicle_type_id
      t.integer :vehicle_brand_id
      t.datetime :retirement_date
      t.integer :retirment_reason

      t.timestamps
    end
  end
end
