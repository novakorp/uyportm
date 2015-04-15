class AddAbbreviationToVehicleBrand < ActiveRecord::Migration
  def change
    add_column :vehicle_brands, :abbreviation, :string

  end
end
