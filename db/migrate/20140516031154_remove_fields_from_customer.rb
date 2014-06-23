class RemoveFieldsFromCustomer < ActiveRecord::Migration
  def change
    remove_column :customers, :phone_number_1, :string
	remove_column :customers, :phone_desc_1, :string
	 remove_column :customers, :phone_number_2, :string
	remove_column :customers, :phone_desc_2, :string
	 remove_column :customers, :phone_number_3, :string
	remove_column :customers, :phone_desc_3, :string
	 remove_column :customers, :phone_number_4, :string
	remove_column :customers, :phone_desc_4, :string
	
	
	remove_column :customers, :street_address_1, :string	
	remove_column :customers, :street_address_2, :string
	
	remove_column :customers, :city, :string	
	remove_column :customers, :country, :string
  end
end
