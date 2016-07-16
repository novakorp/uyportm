class AddGpsDescriptionToVehicles2 < ActiveRecord::Migration
  def change
       add_column :vehicles, :gps_description, :string
  end
end
