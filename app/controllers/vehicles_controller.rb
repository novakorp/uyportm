require 'savon'

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

    
end
