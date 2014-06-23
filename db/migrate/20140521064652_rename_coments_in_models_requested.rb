class RenameComentsInModelsRequested < ActiveRecord::Migration
  def up
		rename_column :m_requested_supplies, :coments ,:comments
		rename_column :m_requested_deliveries, :coments ,:comments
  end
end
