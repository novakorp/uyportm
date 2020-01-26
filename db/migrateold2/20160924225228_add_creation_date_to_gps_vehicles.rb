class AddCreationDateToGpsVehicles < ActiveRecord::Migration
  def change
  
    add_column :gps_vehicles, :creation_date, :datetime
    add_column :vehicles, :creation_date, :datetime
    
  end
end
