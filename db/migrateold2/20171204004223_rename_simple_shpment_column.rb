class RenameSimpleShpmentColumn < ActiveRecord::Migration
  def up
    rename_column :simple_shippings, :service_id, :m_shipping_request_id 
  end

  def down
  end
end
