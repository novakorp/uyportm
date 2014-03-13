class AddDistanceToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :distance, :integer

  end
end
