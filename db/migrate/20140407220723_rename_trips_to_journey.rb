class RenameTripsToJourney < ActiveRecord::Migration
  def change
	rename_table :trips , :journeys
  end
end
