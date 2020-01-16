class SuctaRegistrationsController < ApplicationController 
 
	def new		
		@vehicle = Vehicle.find(params[:vehicle_id])
		@sucta_registration = @vehicle.build_sucta_registration
	end
	
	def create
    @vehicle = Vehicle.find(params[:vehicle_id])
		@sucta_registration = SuctaRegistration.new(obj_params)
		@sucta_registration.vehicle_id = @vehicle.id
		
	  if @sucta_registration.save
		 redirect_to  @vehicle 
	  else
		  render 'new'
	  end
	end

	def show
	  @sucta_registration = SuctaRegistration.find(params[:id])
    @vehicle = Vehicle.find(@sucta_registration.vehicle_id)
	end

	def edit
	  @sucta_registration = SuctaRegistration.find(params[:id])	     
    @vehicle = Vehicle.find(@sucta_registration.vehicle_id) 
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
    params.require(:sucta_registration).permit(:expiration, :extended, :comments)
  end
end

