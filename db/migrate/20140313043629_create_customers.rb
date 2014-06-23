class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.string :phone_number_1
      t.string :phone_desc_1
      t.string :phone_number_2
      t.string :phone_desc_2
      t.string :phone_number_3
      t.string :phone_desc_3
      t.string :phone_number_4
      t.string :phone_desc_4
      t.string :street_address_1
      t.string :street_address_2
      t.string :city
      t.string :country

      t.timestamps
    end
  end
end
