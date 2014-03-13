class TripsController < ApplicationController
	def new
		@trip = Trip.new
	end
	
	def create
	  @trip = Trip.new(params[:trip])

	  if @trip.save
		redirect_to @trip
	  else
		render 'new'
	  end
	end

	def show
	  @trip = Trip.find(params[:id])
	end

	def index
	  @trips = Trip.all
	end

	def edit
	  @trip = Trip.find(params[:id])
	end

	def update
	  @trip = Trip.find(params[:id])
	 
	 if @trip.update_attributes(params[:trip].permit(:from_location, :to_location))
		redirect_to @trip
	  else
		render 'edit'
	 end
	end

	def destroy
	  @trip = Trip.find(params[:id])
	  @trip.destroy
	 
	  redirect_to trips_path
	end
	
end
