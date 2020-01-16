class ModifyVehiclesGni < ActiveRecord::Migration
  def up
    remove_column :vehicles, :gps_numeric_ident 
    
    add_column :vehicles, :gps_numeric_ident, :string
  end

  def down
  end
end
