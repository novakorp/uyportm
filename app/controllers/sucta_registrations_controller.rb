class SuctaRegistrationsController < ApplicationController 
 
	def new		
		@vehicle = Vehicle.find(params[:vehicle_id])
		@sucta_registration = @vehicle.build_sucta_registration
	end
	
	def create
		@vehicle = Veheicle.find(params[:vehicle_id])
		@sucta_registration = SuctaRegistration.new(params[:sucta_registration])
		@sucta_registration.vehicle_id = @vehicle.id
		
	  if @sucta_registration.save
		 redirect_to  @vehicle 
	  else
		render 'new'
	  end
	end

	def show
	  @sucta_registration = SuctaRegistration.find(params[:id])
	end

	def edit
	  @sucta_registration = SuctaRegistration.find(params[:id])	  
	end

	def update
	  @sucta_registration = SuctaRegistration.find(params[:id])	 
	  @vehicle = @sucta_registration.vehicle
	 
	 if @sucta_registration.update_attributes(params[:sucta_registration].permit(:expiration, :extended, :comments))
		redirect_to @vehicle
	  else
		render 'edit'
	 end
	end

	def destroy
	  @sucta_registration = SuctaRegistration.find(params[:id])	
	  @vehicle = @sucta_registration.vehicle
	  @sucta_registration.destroy
	 
	  redirect_to @vehicle
	end
	
end

