class VehicleRegistrationsController < ApplicationController
 
	def new		
		@vehicle = Vehicle.find(params[:vehicle_id])
		@vehicle_registration = @vehicle.build_vehicle_registration
	end
	
	def create
		@vehicle = Vehicle.find(params[:vehicle_id])
		@vehicle_registration = VehicleRegistration.new(params[:vehicle_registration])
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
	 
	 if @vehicle_registration.update_attributes(params[:vehicle_registration].permit(:chassis, :engine, :registration_date, :registration_number, :dnt_id, :entry_date))
		redirect_to @vehicle
	  else
		render 'edit'
	 end
	end

	def destroy
	  @vehicle_registration = VehicleRegistration.find(params[:id])	
	  @vehicle = @vehicle_registration.vehicle
	  @vehicle_registration.destroy
	 
	  redirect_to @vehicle
	end
	
end

