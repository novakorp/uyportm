class RenameRequestedCargo < ActiveRecord::Migration
  def up
	rename_column :m_requested_supplies, :requested_cargo_id , :m_requested_cargo_id
	rename_column :m_requested_deliveries, :requested_cargo_id , :m_requested_cargo_id
	
	
  end
end
