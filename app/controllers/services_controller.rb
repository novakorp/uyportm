class ServicesController < ApplicationController
	def new
		@service = Service.new
	end
	
	def create
	  @service = Service.new(obj_params)

	  if @service.save
		redirect_to @service
	  else
		render 'new'
	  end
	end

	def show
	  @service = Service.find(params[:id])
	end

	def index
	  @services = Service.all
	end

	def edit
	  @service = Service.find(params[:id])
	end

	def update
	  @service = Service.find(params[:id])
	 
	 if @service.update_attributes(params[:service].permit(:description, :billing_unit_id, :vehicle_type_id, :couple_type_id, :couple_required, :company_id))
		redirect_to @service
	  else
		render 'edit'
	 end
	end

	def destroy
	  @service = Service.find(params[:id])
	  @service.destroy
	  
    @action_result_code="1"
    @action_result_desc="OK"
    @action_result_data="{}"
      
    respond_to do |format|
      format.html { redirect_to services_path }
      format.js { render "/common/action_result.js" }
    end  
	end
	
  private

  def obj_params
    params.require(:service).permit(:description, :billing_unit_id, :vehicle_type_id, :couple_type_id, :couple_required, :company_id)
  end
end
