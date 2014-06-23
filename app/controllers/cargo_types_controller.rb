class CargoTypesController < ApplicationController
	def new
		@cargo_type = CargoType.new
	end
	
	def create
	  @cargo_type = CargoType.new(params[:cargo_type])

	  if @cargo_type.save
		redirect_to @cargo_type
	  else
		render 'new'
	  end
	end

	def show
	  @cargo_type = CargoType.find(params[:id])
	end

	def index
	  @cargo_types = CargoType.all
	end

	def edit
	  @cargo_type = CargoType.find(params[:id])
	end

	def update
	  @cargo_type = CargoType.find(params[:id])
	 
	 if @cargo_type.update_attributes(params[:cargo_type].permit(:description, :cargo_category_id, :measure_unit_id))
		redirect_to @cargo_type
	  else
		render 'edit'
	 end
	end

	def destroy
	  @cargo_type = CargoType.find(params[:id])
	  @cargo_type.destroy
	 
	  redirect_to cargo_types_path
	end
	
end
