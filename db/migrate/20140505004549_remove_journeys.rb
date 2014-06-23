class RemoveJourneys < ActiveRecord::Migration
  def change
	drop_table :journeys
  end
 
end
