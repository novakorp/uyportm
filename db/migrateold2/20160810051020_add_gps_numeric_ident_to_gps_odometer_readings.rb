class AddGpsNumericIdentToGpsOdometerReadings < ActiveRecord::Migration
  def change
    add_column :gps_odometer_readings, :gps_numeric_ident, :string

  end
end
