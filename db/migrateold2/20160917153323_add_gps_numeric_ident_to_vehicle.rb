class AddGpsNumericIdentToVehicle < ActiveRecord::Migration
  def change
    add_column :vehicles, :gps_numeric_ident, :integer

  end
end
