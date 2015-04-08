class CustMsr < ActiveRecord::Migration
  def change
    add_column :m_shipping_requests, :customer_id, :integer
  end
end
