class CorrectBillingUnitSimpleShipping < ActiveRecord::Migration
  def up
    rename_column :simple_shippings, :measure_unit_id, :billing_unit_id
  end

  def down
  end
end
