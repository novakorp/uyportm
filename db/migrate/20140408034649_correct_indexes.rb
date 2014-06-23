class CorrectIndexes < ActiveRecord::Migration
  def change
	rename_index :journeys, :from_location_id, :index_journeys_on_from_location_id
  end
end
