
class VehiclesController < ApplicationController
  include VehiclesHelper
  
	def new
		@vehicle = Vehicle.new
		 
	end

	def create
	  @vehicle = Vehicle.new(params[:vehicle])

	  if @vehicle.save
		redirect_to @vehicle
	 else
		render 'new'
	  end
	end

  
	def show
	  
	  @vehicle = Vehicle.find(params[:id]) 
	  
	   
	   # Obtener datos de km realizados en los ultimos 30 dias
	   
  	 g_km_lab = []
     g_km_val = []
     i=0
     
     resul = ActiveRecord::Base.connection.execute("SELECT date(gps_datetime), sum(difference) FROM vehicle_odometer_readings where vehicle_id=" + params[:id].to_s + " group by 1 order by 1 asc limit 30")
           
     @data = resul.values
     
     @data.each do |row|
       g_km_lab[i]=row[0]
       g_km_val[i]=row[1]  
        
       i+=1
     end
          
     @g_km_labels = g_km_lab.to_s     
     @g_km_values= num_arr_to_json g_km_val
    
	end

	
	def index
    
	  @vehicles = Vehicle.order(:number_plate )
    
	end

	def edit
	  @vehicle = Vehicle.find(params[:id])
	end

	def update
	  @vehicle = Vehicle.find(params[:id])
	 
	 if @vehicle.update_attributes(params[:vehicle].permit(:company_id, :vehicle_type_id, :vehicle_brand_id, :model, :number_plate, :comments))
		redirect_to @vehicle
	 else
		render 'edit'
	 end
	end

	def destroy
	  @vehicle = Vehicle.find(params[:id])
	  @vehicle.destroy
	 
	  redirect_to vehicles_path
	end
  
  def update_positions 
  
    # Definida en vehicles_helper
    update_vehicle_positions
    
  end

  def save_odometer_readings
    
     # Definida en vehicles_helper
     @wsdata = vh_save_odometer_readings
  end
  
  def update_vehicles_gps_data
    
     # Definida en vehicles_helper
    vh_update_vehicles_gps_data
  end
  
  def update_from_gps_data
    vh_update_from_gps_data
  end
  
  def create_from_gps_data
    vh_create_from_gps_data
  end
  
  def vehicle_odometer_readings
    @data = VehicleOdometerReading.order("gps_vehicle_id desc, gps_datetime desc")
  end
    
    
 def top_kilometers_done
   
   g_km_lab = []
   g_km_val = []
   i=0
   
   resul = ActiveRecord::Base.connection.execute("SELECT number_plate, sum(difference) FROM vehicle_odometer_readings o join vehicles v on o.vehicle_id=v.id join vehicle_types vt on v.vehicle_type_id = vt.id Where vt.description like 'Cami%' or vt.description like 'Tractor%' GROUP BY number_plate order by 2 Desc")
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
 
end



