class RenameNumberPlateVehicle < ActiveRecord::Migration
  def up
    rename_column :vehicles, :number_plate, :plate_number
  
  end

  def down
  end
end
