class VehicleBrandsController < ApplicationController
	def new
		@vehicle_brand = VehicleBrand.new
	end
	
	def create
	  @vehicle_brand = VehicleBrand.new(params[:vehicle_brand])

	  if @vehicle_brand.save
		redirect_to @vehicle_brand
	  else
		render 'new'
	  end
	end

	def show
	  @vehicle_brand = VehicleBrand.find(params[:id])
	end

	def index
	  @vehicle_brands = VehicleBrand.all
	end

	def edit
	  @vehicle_brand = VehicleBrand.find(params[:id])
	end

	def update
	  @vehicle_brand = VehicleBrand.find(params[:id])
	 
	 if @vehicle_brand.update_attributes(params[:vehicle_brand].permit(:name, :abbreviation, :country_of_origin))
		redirect_to @vehicle_brand
	  else
		render 'edit'
	 end
	end

	def destroy
	  @vehicle_brand = VehicleBrand.find(params[:id])
	  @vehicle_brand.destroy
	 
	  redirect_to vehicle_brands_path
	end
	
end
