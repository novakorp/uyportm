class FixAmountCols < ActiveRecord::Migration
  def change
    rename_column :m_requested_cargos, :ammount, :amount
    rename_column :m_requested_supplies, :ammount, :amount
    rename_column :m_requested_deliveries, :ammount, :amount
    
    rename_column :shipment_supplies, :ammount, :amount
    rename_column :shipment_deliveries, :ammount, :amount
  end
end
