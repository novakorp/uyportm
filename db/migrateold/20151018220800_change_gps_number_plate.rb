class ChangeGpsNumberPlate < ActiveRecord::Migration
  def up
      remove_column :vehicles, :gps_number_plate
      add_column :vehicles, :gps_number_plate, :string
  end

  def down
  end
end
