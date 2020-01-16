class RequestedSuppliesController < ApplicationController
	def new		
		@requested_cargo = RequestedCargo.find(params[:requested_cargo_id])
		@requested_supply = @requested_cargo.requested_supplies.build 
	end
	
	def create
		@requested_cargo = RequestedCargo.find(params[:requested_cargo_id])
		@requested_supply = RequestedSupply.new(obj_params)
		@requested_supply.requested_cargo_id = @requested_cargo.id
		
	  if @requested_supply.save
		 redirect_to  @requested_cargo 
	  else
		render 'new'
	  end
	end

	def show
	  @requested_supply = RequestedSupply.find(params[:id])
	end

	def edit
	  @requested_supply = RequestedSupply.find(params[:id])	  
	end

	def update
	  @requested_supply = RequestedSupply.find(params[:id])	
	  @requested_cargo = @requested_supply.requested_cargo
	 
	 if @requested_supply.update_attributes(params[:requested_supply].permit(:ammount, :cargo_type_id, :measure_unit_id,  :address_id))
		redirect_to @requested_cargo
	  else
		render 'edit'
	 end
	end

	def destroy
	  @requested_supply = RequestedSupply.find(params[:id])	
	  @requested_cargo = @requested_supply.requested_cargo
	  @requested_supply.destroy
	 
	 
    @action_result_code="1"
    @action_result_desc="OK"
    @action_result_data="{}"
      
    respond_to do |format|
      format.html { redirect_to @requested_cargo }
      format.js { render "/common/action_result.js" }
    end 
     
	end
	
  private

  def obj_params
    params.require(:requested_supply).permit(:ammount, :cargo_type_id, :measure_unit_id,  :address_id)
  end
end
