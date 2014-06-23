class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.integer :from_location_id
      t.integer :to_location_id
      t.integer :distance
      t.string :route_itinerary
      t.string :comments

      t.timestamps
    end
	 add_index :trips, :from_location_id
    add_index :trips, :to_location_id
  end
end
