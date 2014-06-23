class ShipmentsController < ApplicationController
 
	def new
		@shipping_request = ShippingRequest.find(params[:id])
		@shipment = Shipment.new
		@shipment.shipping_request_id = (params[:id])
	end
	
	def create
	  @shipment = Shipment.new(params[:shipment])


	  if @shipment.save
	    supplies = (params[:supplies])
	  	supplies.each do |sup_key, sup_val|
			sup = ShipmentSupply.new
			
			sup.shipment_id = @shipment.id
			sup.ammount = sup_val[:ammount]			
			sup.requested_supply_id = sup_key.to_i
			sup.save
		end
	  
	    deliveries = (params[:deliveries])
	  	deliveries.each do |del_key, del_val|
			del = ShipmentDelivery.new
			
			del.shipment_id = @shipment.id
			del.ammount = del_val[:ammount]			
			del.requested_delivery_id = del_key.to_i
			del.save
		end
	  
		redirect_to @shipment
		
	  else
		render 'new'
	  end
	end

	def show
	  @shipment = Shipment.find(params[:id])
	  
	  @supplies = ShipmentSupply.where(shipment_id: params[:id]).joins(requested_supply: :address).order('addresses.description')
	  @deliveries = ShipmentDelivery.where(shipment_id: params[:id]).joins(requested_delivery: :address).order('addresses.description')
	  
	end

	def index
	  @shipments = Shipment.all
	end

	def edit
	  @shipment = Shipment.find(params[:id])
	end

	def update
	  @shipment = Shipment.find(params[:id])
	 
	 if @shipment.update_attributes(params[:shipment].permit(:shipping_request_id, :vehicle_id, :coupled_vehicle_id, :driver_id, :status, :comments, :departure_time, :arrival_time))
		redirect_to @shipment
	  else
		render 'edit'
	 end
	end

	def destroy
	  @shipment = Shipment.find(params[:id])
	  @shipment.destroy
	 
	  redirect_to shipments_path
	end
	
end



