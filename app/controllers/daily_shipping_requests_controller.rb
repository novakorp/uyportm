class DailyShippingRequestsController < ApplicationController
	
	def list
		if params[:date_select]
		
			@date_select = params[:date_select]
			@listing_date = Date.strptime(params[:date_select], '%d-%m-%Y')
			
		else
		
			@listing_date = Date.today
			@date_select = @listing_date.strftime("%d-%m-%Y")
			
		end
		
		@shipments = Shipment.where("departure_time >=? and departure_time <? ",@listing_date,@listing_date+1)
	end

end
