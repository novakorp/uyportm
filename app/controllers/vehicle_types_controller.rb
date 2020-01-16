class VehicleTypesController < ApplicationController
	def new
		@vehicle_type = VehicleType.new
	end
	
	def create
	  @vehicle_type = VehicleType.new(obj_params)

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
	 
	 if @vehicle_type.update_attributes(params[:vehicle_type].permit(:description, :coupling_support, :couples_to_type_id, :type_group))
		redirect_to @vehicle_type
	  else
		render 'edit'
	 end
	end

	def destroy
	  @vehicle_type = VehicleType.find(params[:id])
	  @vehicle_type.destroy
	 
    @action_result_code="1"
    @action_result_desc="OK"
    @action_result_data="{}"
      
    respond_to do |format|
      format.html { redirect_to vehicle_types_path }
      format.js { render "/common/action_result.js" }
    end  
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
	
  private

  def obj_params
    params.require(:vehicle_type).permit(:description, :coupling_support, :couples_to_type_id, :type_group)
  end
end
