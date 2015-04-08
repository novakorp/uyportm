class DropRequestedCargos < ActiveRecord::Migration
  def change
    drop_table :requested_deliveries
    drop_table :requested_supplies
    drop_table :requested_cargos
  end
end
