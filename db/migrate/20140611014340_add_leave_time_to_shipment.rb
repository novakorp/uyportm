class AddLeaveTimeToShipment < ActiveRecord::Migration
  def change
    add_column :shipments, :departure_time, :datetime
	add_column :shipments, :arrival_time, :datetime

  end
end
