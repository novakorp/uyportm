class AddNameToMShippingRequest < ActiveRecord::Migration
  def change
    add_column :m_shipping_requests, :name, :string

  end
end
