class Location < ActiveRecord::Base
	has_many :incoming_trips, class_name: "Trip", foreign_key: "to_location_id"
	has_many :outgoing_trips, class_name: "Trip", foreign_key: "from_location_id"
end
