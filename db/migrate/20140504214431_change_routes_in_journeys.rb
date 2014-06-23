class ChangeRoutesInJourneys < ActiveRecord::Migration
  def change
	 change_table :journeys do |t|
	  t.rename :routes, :route_itinerary
	end
  end
end
