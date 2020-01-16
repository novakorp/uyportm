class AddDifferenceToGpsOdometerReadings < ActiveRecord::Migration
  def change
    add_column :gps_odometer_readings, :difference, :integer

  end
end
