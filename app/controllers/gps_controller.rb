class GpsController < ApplicationController
  include GpsHelper
   
  def create_vehicles
      gps_h_create_vehicles 
  end
  
  
  def compare_gps_vehicles
    gps_h_compare_gps_vehicles 
    
    gps_h_process_gps_changes
  end
  
  
  def gps_changes
    @changes = GpsChange.all
     
  end
  
  
  def update_gps_vehicles
     # Definida en vehicles_helper
    gps_h_update_gps_vehicles
    
    @vehicles = GpsVehicle.all
  end
  
  
  def save_odometer_readings
     # Definida en vehicles_helper
     @wsdata = gps_h_save_odometer_readings
  end
  
  
  def update_positions 
  
    # Definida en vehicles_helper
    gps_h_update_vehicle_positions
    
    @vehicles = Vehicle.all
  end
  
  
  
#  def create_from_gps_data
    # gps_h_create_from_gps_data
#  end
  
  def vehicle_odometer_readings
    @data = GpsOdometerReading.order("gps_numeric_ident desc, gps_datetime desc")
    
  end
      
      
  def top_kilometers_done
   
    g_km_lab = []
    g_km_val = []
    i=0
     
    resul = ActiveRecord::Base.connection.execute("SELECT plate_number, sum(difference) FROM vehicle_odometer_readings o join vehicles v on o.vehicle_id=v.id join vehicle_types vt on v.vehicle_type_id = vt.id Where vt.description like 'Cami%' or vt.description like 'Tractor%' GROUP BY plate_number order by 2 Desc")
    resul2 = ActiveRecord::Base.connection.execute("SELECT min(date(gps_datetime)), max(date(gps_datetime)) FROM vehicle_odometer_readings ")
           
    @data = resul.values
    @dates = resul2.values
     
     
    @data.each do |row|
    g_km_lab[i]=row[0]
    g_km_val[i]=row[1]  
        
    i+=1
    end
     
     
    @g_km_labels = g_km_lab.to_s
     
    @g_km_values=num_arr_to_json g_km_val
      
  end
 
  # Genera un string con el json correspondiente para un array de numeros
  def num_arr_to_json(num_arr)
    res_json="["
    i=1

    num_arr.each do |val|
      if i != 1
        res_json = res_json + ", "
      end

      if val != nil
      res_json = res_json + val.to_s
      else
        res_json = res_json + "0"
      end

      i = i+1
    end

    res_json+="]"

    return res_json
  end

  
  def vehicle_positions 
    @vehicles = Vehicle.order(:plate_number ) 
  end 
  
end


