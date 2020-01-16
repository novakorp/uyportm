class TripsController < ApplicationController
	def new
		@trip = Trip.new
	end
	
	def create
	  @trip = Trip.new(obj_params)

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
	 
	 if @trip.update_attributes(params[:trip].permit(:code, :from_location_id, :to_location_id, :description, :distance))
		redirect_to @trip
	  else
		render 'edit'
	 end
	end

	def destroy
	  @trip = Trip.find(params[:id])
	  @trip.destroy
	 
    @action_result_code="1"
    @action_result_desc="OK"
    @action_result_data="{}"
      
    respond_to do |format|
      format.html { redirect_to trips_path }
      format.js { render "/common/action_result.js" }
    end  
	end
	
  private

  def obj_params
    params.require(:trip).permit(:code, :from_location_id, :to_location_id, :description, :distance)
  end
end
