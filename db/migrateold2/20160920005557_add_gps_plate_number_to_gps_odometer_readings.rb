class AddGpsPlateNumberToGpsOdometerReadings < ActiveRecord::Migration
  def change
    add_column :gps_odometer_readings, :gps_plate_number, :string

  end
end
