class AddGpsDescriptiveIdentToGpsOdometerReadings < ActiveRecord::Migration
  def change
    add_column :gps_odometer_readings, :gps_descriptive_ident, :string

  end
end
