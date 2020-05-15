include GpsHelper

scheduler = Rufus::Scheduler.new

scheduler.every("30m") do   
   gps_h_update_gps_installations
   puts "Fin Actualizar Instalaciones GPS.. "
end 

scheduler2 = Rufus::Scheduler.new

scheduler2.every("30m") do      
     gps_h_save_odometer_readings   
     puts "Fin actualizar lecturas Km .."     
end 


scheduler3 = Rufus::Scheduler.new

scheduler2.every("30m") do      
     gps_h_update_vehicle_positions   
     puts "Fin actualizar posiciones .."     
end 




