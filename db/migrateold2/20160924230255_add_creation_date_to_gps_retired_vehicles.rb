class AddCreationDateToGpsRetiredVehicles < ActiveRecord::Migration
  def change
    add_column :gps_retired_vehicles, :creation_date, :datetime

  end
end
