class AddStateToLocation < ActiveRecord::Migration
  def change
    add_column :locations, :state_id, :integer
	
	  add_index :locations, :state_id
  end
  

end
