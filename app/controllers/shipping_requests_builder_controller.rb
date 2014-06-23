class ShippingRequestsBuilderController < ApplicationController
	def start
	end
	
	def fill_data  
		@mshipping  = MShippingRequest.find (params[:m_shipping_request_id])
	end
	
	def create_from_template
		msr  = MShippingRequest.find (params[:m_shipping_request_id])
		sr = ShippingRequest.new	
		cargo_data = params[:cargo]
		
		sr.request_date = Date.today
		sr.required_shipment_date = Date.new(params[:required_shipment_date][:year].to_i, params[:required_shipment_date][:month].to_i, params[:required_shipment_date][:day].to_i)
		sr.service_id = msr.service_id
		sr.trip_id = msr.trip_id
		sr.account_id = msr.account_id
		sr.details = msr.details	
		sr.simple_shipment = msr.simple_shipment	

		
		sr.save
		
		cargo = RequestedCargo.new
		
		cargo_data.each do |key, value|
			cargo.cargo_type_id = value[:cargo_type_id]
			cargo.ammount = value[:ammount]
			cargo.measure_unit_id = value[:measure_unit_id] 
		
			cargo.shipping_request_id = sr.id
			cargo.save
			
			supplies = value[:supplies]
			
			supplies.each do |sup_key, sup_val|
				sup = RequestedSupply.new
				
				sup.ammount = sup_val[:ammount]
				sup.address_id = sup_val[:address_id]
				sup.comments = sup_val[:comments]
			
				sup.requested_cargo_id = cargo.id
				sup.save
			end
			
			deliveries = value[:deliveries]
			
			deliveries.each do |deliv_key, deliv_val|
				deliv = RequestedDelivery.new
				
				deliv.ammount = deliv_val[:ammount]
				deliv.address_id = deliv_val[:address_id]
				deliv.comments = deliv_val[:comments]
			
				deliv.requested_cargo_id = cargo.id
				deliv.save
			end
		end		
		
		redirect_to shipping_requests_url
	end
end


