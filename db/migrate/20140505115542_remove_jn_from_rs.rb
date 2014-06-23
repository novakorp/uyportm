class RemoveJnFromRs < ActiveRecord::Migration
  
 def change	
	remove_index "shipping_requests",  :name => "index_shipping_requests_on_journey_id"
	
	remove_column :shipping_requests, :journey_id
	 
  end	 
end
