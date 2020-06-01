
class VehiclesController < ApplicationController
  include VehiclesHelper
  
	def new
		@vehicle = Vehicle.new
		 
	end

	def create
	  @vehicle = Vehicle.new(obj_params)

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
     
     # resul = ActiveRecord::Base.connection.execute("SELECT date(gps_datetime), sum(difference) FROM vehicle_odometer_readings where vehicle_id=" + params[:id].to_s + " group by 1 order by 1 asc limit 30")
           
    # @data = resul.values
     
     #@data.each do |row|
      # g_km_lab[i]=row[0]
      # g_km_val[i]=row[1]  
        
      # i+=1
     # end
           
    # @g_km_labels = g_km_lab.to_s     
    # @g_km_values= num_arr_to_json g_km_val
    
	end

	
	def index 
	  
	  @vehicles = Vehicle.order(:plate_number )
	  @sort_options = sort_options 
	end



  def index_sort
    sort_field=params[:field] 
    sort_order=params[:order] 
    
    if sort_field.include? "-" 
      sort_field["-"] = "."
    end
       
    
    @vehicles=Vehicle.joins(:vehicle_brand).order(sort_field + " " + sort_order)
      
    @order_string=".order(" +sort_field + ")"
    
    @sort_options = sort_options 
    render 'index'
  end

 

	def edit
	  @vehicle = Vehicle.find(params[:id])
	end

	def update
	  @vehicle = Vehicle.find(params[:id])
	 
	 if @vehicle.update_attributes(params[:vehicle].permit(:company_id, :vehicle_type_id, :vehicle_brand_id, :model, :year, :status, :plate_number, :default_driver_id, :gps_numeric_ident, :creation_date, :comments))
		redirect_to @vehicle
	 else
		render 'edit'
	 end
	end

	def destroy
	  @vehicle = Vehicle.find(params[:id])
	  @vehicle.destroy
	 
    @action_result_code="1"
    @action_result_desc="OK"
    @action_result_data="{}"
      
    respond_to do |format|
      format.html { redirect_to vehicles_path }
      format.js { render "/common/action_result.js" }
    end  
	end
  
 
 
  def report_sucta_reg
    @sucta_registrations = SuctaRegistration.all
  end

  def report_vehicle_reg
    @vehicle_registrations = VehicleRegistration.all
  end
  
  
  private

  def obj_params
    params.require(:vehicle).permit(:company_id, :vehicle_type_id, :vehicle_brand_id, :model, :year, :status, :plate_number, :default_driver_id, :gps_numeric_ident, :creation_date, :comments)
  end

  
  
end



