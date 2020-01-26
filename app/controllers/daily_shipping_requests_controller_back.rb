class DailyShippingRequestsController < ApplicationController
	
	def list
		if params[:listing_date]
			@listing_date = Date.new(params[:listing_date][:year].to_i, params[:listing_date][:month].to_i, params[:listing_date][:day].to_i)
		else
			@listing_date = Date.today
		end
		@shipping_requests = ShippingRequest.where(required_shipment_date: @listing_date)
	end


end
