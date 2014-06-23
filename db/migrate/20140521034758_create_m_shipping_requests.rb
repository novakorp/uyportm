class CreateMShippingRequests < ActiveRecord::Migration
  def change
    create_table :m_shipping_requests do |t|
      t.string :contact
      t.string :details

      t.timestamps
    end
  end
end
