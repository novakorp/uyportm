class ShipmentSuppliesController < ApplicationController
	def new		
		@shipment = Shipment.find(params[:shipment_id])
		@shipment_supply = @shipment.shipment_supplies.build 
	end
	
	def create
		@shipment = Shipment.find(params[:shipment_id])
		@shipment_supply = ShipmentSupply.new(params[:shipment_supply])
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
	 
	 if @shipment_supply.update_attributes(params[:shipment_supply].permit(:ammount, :requested_delivery_id))
		redirect_to @shipment
	  else
		render 'edit'
	 end
	end

	def destroy
	  @shipment_supply = ShipmentSupply.find(params[:id])	
	  @shipment = @shipment_supply.shipment
	  @shipment_supply.destroy
	 
	  redirect_to @shipment
	end
	
end
