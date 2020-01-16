class AddScheduleToShipment < ActiveRecord::Migration
  def change
    add_column :shipments, :schedule, :integer
  end
end
