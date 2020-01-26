class ShipmentDeliveriesController < ApplicationController
	def new		
		@shipment = Shipment.find(params[:shipment_id])
		@shipment_delivery = @shipment.shipment_deliveries.build 
	end
	
	def create
		@shipment = Shipment.find(params[:shipment_id])
		@shipment_delivery = ShipmentDelivery.new(obj_params)
		@shipment_delivery.shipment_id = @shipment.id
		
	  if @shipment_delivery.save
		 redirect_to  @shipment 
	  else
		render 'new'
	  end
	end

	def show
	  @shipment_delivery = ShipmentDelivery.find(params[:id])
	end

	def edit
	  @shipment_delivery = ShipmentDelivery.find(params[:id])	  
	end

	def update
	  @shipment_delivery = ShipmentDelivery.find(params[:id])	 
	  @shipment = @shipment_delivery.shipment
	 
	 if @shipment_delivery.update_attributes(params[:shipment_delivery].permit(:amount, :requested_delivery_id))
		redirect_to @shipment
	  else
		render 'edit'
	 end
	end

	def destroy
	  @shipment_delivery = ShipmentDelivery.find(params[:id])	
	  @shipment = @shipment_delivery.shipment
	  @shipment_delivery.destroy
	 
	 
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
    params.require(:shipment_delivery).permit(:amount, :requested_delivery_id)
  end
end
