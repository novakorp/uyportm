class CargoTypesController < ApplicationController
	def new
		@cargo_type = CargoType.new
	end
	
	def create
	  @cargo_type = CargoType.new(obj_params)

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
	 
    @action_result_code="1"
    @action_result_desc="OK"
    @action_result_data="{}"
      
    respond_to do |format|
      format.html { redirect_to cargo_types_path }
      format.js { render "/common/action_result.js" }
    end 
	  
	end
	
  private

  def obj_params
    params.require(:cargo_type).permit(:description, :cargo_category_id, :measure_unit_id)
  end
end
