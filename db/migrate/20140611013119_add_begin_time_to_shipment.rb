class AddBeginTimeToShipment < ActiveRecord::Migration
  def change
    add_column :shipments, :begin_time, :time

  end
end
