class LocationsController < ApplicationController
	def new
		@location = Location.new
	end

	def create
	  @location = Location.new(obj_params)

	  if @location.save
		redirect_to @location
	  else
		render 'new'
	  end
	end

	def show
	  @location = Location.find(params[:id])
	end

	def index
	  @locations = Location.order("name asc")
	end

	def edit
	  @location = Location.find(params[:id])
	end

	def update
	  @location = Location.find(params[:id])
	 
	 if @location.update_attributes(params[:location].permit(:name, :coords, :location_type, :state_id, :longitude, :latitude))
		redirect_to @location
	  else
		render 'edit'
	 end
	end

	def destroy
	  @location = Location.find(params[:id])
	  @location.destroy
	  
    @action_result_code="1"
    @action_result_desc="OK"
    @action_result_data="{}"
      
    respond_to do |format|
      format.html { redirect_to locations_path }
      format.js { render "/common/action_result.js" }
    end 
	  
	end
	
  private

  def obj_params
    params.require(:location).permit(:name, :coords, :location_type, :state_id, :longitude, :latitude)
  end
end


