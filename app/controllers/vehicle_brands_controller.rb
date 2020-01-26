class VehicleBrandsController < ApplicationController
	def new
		@vehicle_brand = VehicleBrand.new
	end
	
	def create
	  @vehicle_brand = VehicleBrand.new(obj_params)

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
	 
    @action_result_code="1"
    @action_result_desc="OK"
    @action_result_data="{}"
      
    respond_to do |format|
      format.html { redirect_to vehicle_brands_path }
      format.js { render "/common/action_result.js" }
    end  
	end
	
  private

  def obj_params
    params.require(:vehicle_brand).permit(:name, :abbreviation, :country_of_origin)
  end
end
