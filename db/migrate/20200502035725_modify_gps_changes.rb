class ModifyGpsChanges < ActiveRecord::Migration
  def change
  
    add_column :gps_changes, :action_performed, :integer
    add_column :gps_changes, :date_processed, :datetime 
    add_column :gps_changes, :pending, :boolean
    
    remove_column :gps_changes, :status
    
  end
end
