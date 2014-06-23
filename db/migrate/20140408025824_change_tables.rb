class ChangeTables < ActiveRecord::Migration
  def change
	 drop_table :job_specs
	
	 rename_table :job_types , :services
	 rename_table :shipping_addresses , :addresses	  
  end
end
