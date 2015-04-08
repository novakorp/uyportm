class VehicleTypesController < ApplicationController
	def new
		@vehicle_type = VehicleType.new
	end
	
	def create
	  @vehicle_type = VehicleType.new(params[:vehicle_type])

	  if @vehicle_type.save
		redirect_to @vehicle_type
	  else
		render 'new'
	  end
	end

	def show
	  @vehicle_type = VehicleType.find(params[:id])
      
      @couple_id=''
	end

	def index
	  @vehicle_types = VehicleType.all
	end

	def edit
	  @vehicle_type = VehicleType.find(params[:id])
	end

	def update
	  @vehicle_type = VehicleType.find(params[:id])
	 
	 if @vehicle_type.update_attributes(params[:vehicle_type].permit(:description, :coupling_support, :couples_to_type_id))
		redirect_to @vehicle_type
	  else
		render 'edit'
	 end
	end

	def destroy
	  @vehicle_type = VehicleType.find(params[:id])
	  @vehicle_type.destroy
	 
	  redirect_to vehicle_types_path
	end
	
	def couplable_types_by_id
	  if params[:id].present?
		@couplable_types = VehicleType.find(params[:id]).couplable_types
		@element_id = params[:element_id]
	  else
		@couplable_types = []
	  end

	  respond_to do |format|
		format.js 
		format.html
	  end
	end
end
