include VehiclesHelper

scheduler = Rufus::Scheduler.new

scheduler.every("15m") do   
   update_vehicle_positions
   puts "Fin Actualizacion .. "
end 


