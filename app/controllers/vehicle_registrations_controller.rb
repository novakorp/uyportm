class VehicleRegistrationsController < ApplicationController
 
	def new		
		@vehicle = Vehicle.find(params[:vehicle_id])
		@vehicle_registration = @vehicle.build_vehicle_registration
	end
	
	def create
		@vehicle = Vehicle.find(params[:vehicle_id])
		@vehicle_registration = VehicleRegistration.new(obj_params)
		@vehicle_registration.vehicle_id = @vehicle.id
		
	  if @vehicle_registration.save
		 redirect_to  @vehicle 
	  else
		render 'new'
	  end
	end

	def show
	  @vehicle_registration = VehicleRegistration.find(params[:id]) 
	end

	def edit
	  @vehicle_registration = VehicleRegistration.find(params[:id])	 
	end

	def update
	  @vehicle_registration = VehicleRegistration.find(params[:id])	 
	  @vehicle = @vehicle_registration.vehicle
	 
	 if @vehicle_registration.update_attributes(params[:vehicle_registration].permit(:chassis, :engine, :registration_date, :registration_number, :dnt_id, :date_of_entry))
		redirect_to @vehicle
	  else
		render 'edit'
	 end
	end

	def destroy
	  @vehicle_registration = VehicleRegistration.find(params[:id])	
	  @vehicle = @vehicle_registration.vehicle
	  @vehicle_registration.destroy
	 
    @action_result_code="1"
    @action_result_desc="OK"
    @action_result_data="{}"
      
    respond_to do |format|
      format.html { redirect_to @vehicle }
      format.js { render "/common/action_result.js" }
    end 
      
	end
	
  
  private

  def obj_params
    params.require(:vehicle_registration).permit(:chassis, :engine, :registration_date, :registration_number, :dnt_id, :date_of_entry)
  end
end

