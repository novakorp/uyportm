class CreateBillingUnits < ActiveRecord::Migration
  def change
    create_table :billing_units do |t|
      t.string :description
      t.string :code

      t.timestamps
    end
  end
end
