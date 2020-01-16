class ShipmentSuppliesController < ApplicationController
	def new		
		@shipment = Shipment.find(params[:shipment_id])
		@shipment_supply = @shipment.shipment_supplies.build 
	end
	
	def create
		@shipment = Shipment.find(params[:shipment_id])
		@shipment_supply = ShipmentSupply.new(obj_params)
		@shipment_supply.shipment_id = @shipment.id
		
	  if @shipment_supply.save
		 redirect_to  @shipment 
	  else
		render 'new'
	  end
	end

	def show
	  @shipment_supply = ShipmentSupply.find(params[:id])
	end

	def edit
	  @shipment_supply = ShipmentSupply.find(params[:id])	  
	end

	def update
	  @shipment_supply = ShipmentSupply.find(params[:id])	 
	  @shipment = @shipment_supply.shipment
	 
	 if @shipment_supply.update_attributes(params[:shipment_supply].permit(:amount, :requested_delivery_id))
		redirect_to @shipment
	  else
		render 'edit'
	 end
	end

	def destroy
	  @shipment_supply = ShipmentSupply.find(params[:id])	
	  @shipment = @shipment_supply.shipment
	  @shipment_supply.destroy
	 
    @action_result_code="1"
    @action_result_desc="OK"
    @action_result_data="{}"
      
    respond_to do |format|
      format.html { redirect_to @shipment }
      format.js { render "/common/action_result.js" }
    end 
    
	end
	
  private

  def obj_params
    params.require(:shipment_supply).permit(:amount, :requested_delivery_id)
  end
end
