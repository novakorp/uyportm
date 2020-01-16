class RequestedCargosController < ApplicationController
	def new		
		@shipping_request = ShippingRequest.find(params[:shipping_request_id])
		@requested_cargo = @shipping_request.requested_cargos.build 
	end
	
	def create
		@shipping_request = ShippingRequest.find(params[:shipping_request_id])
		@requested_cargo = RequestedCargo.new(obj_params)
		@requested_cargo.shipping_request_id = @shipping_request.id
		
	  if @requested_cargo.save
		 redirect_to  @shipping_request 
	  else
		render 'new'
	  end
	end

	def show
	
	  @requested_cargo = RequestedCargo.find(params[:id])
	  @shipping_request = @requested_cargo.shipping_request
	end

	def edit
	  @requested_cargo = RequestedCargo.find(params[:id])	  
	end

	def update
	  @requested_cargo = RequestedCargo.find(params[:id])	 
	  @shipping_request = @requested_cargo.shipping_request
	 
	 if @requested_cargo.update_attributes(params[:requested_cargo].permit(:ammount, :cargo_type_id, :measure_unit_id))
		redirect_to @shipping_request
	  else
		render 'edit'
	 end
	end

	def destroy
	  @requested_cargo = RequestedCargo.find(params[:id])	
	  @shipping_request = @requested_cargo.shipping_request
	  @requested_cargo.destroy
	 
    @action_result_code="1"
    @action_result_desc="OK"
    @action_result_data="{}"
      
    respond_to do |format|
      format.html { redirect_to @shipping_request }
      format.js { render "/common/action_result.js" }
    end  
	end
	
  private

  def obj_params
    params.require(:requested_cargo).permit(:ammount, :cargo_type_id, :measure_unit_id)
  end
end
