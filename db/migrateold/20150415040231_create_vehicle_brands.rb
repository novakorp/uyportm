class CreateVehicleBrands < ActiveRecord::Migration
  def change
    create_table :vehicle_brands do |t|
      t.string :name
      t.string :country_of_origin

      t.timestamps
    end
  end
end
