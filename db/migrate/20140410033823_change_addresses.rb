class ChangeAddresses < ActiveRecord::Migration
  def change
	rename_column :addresses , :recipient, :description
	remove_column :requested_deliveries, :recipient_name
	add_column :requested_deliveries, :comments, :text
  end
end
