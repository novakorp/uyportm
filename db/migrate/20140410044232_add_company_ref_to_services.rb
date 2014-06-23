class AddCompanyRefToServices < ActiveRecord::Migration
 def change
    add_column :services , :company_id , :integer 
 
  
    add_index "services", ["company_id"], :name => "index_services_on_company_id"
	
 end	
end
