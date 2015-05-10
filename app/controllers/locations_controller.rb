class LocationsController < ApplicationController
	def new
		@location = Location.new
	end

	def create
	  @location = Location.new(params[:location])

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
	 
	  redirect_to locations_path
	end
end


