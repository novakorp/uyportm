class ShippingRequestsController < ApplicationController
	def new
		@shipping_request = ShippingRequest.new
	end
	
	def create
	  @shipping_request = ShippingRequest.new(params[:shipping_request])

	  if @shipping_request.save
		redirect_to @shipping_request
	  else
		render 'new'
	  end
	end

	def show
	  @shipping_request = ShippingRequest.find(params[:id])
	end

	def index
	  @shipping_requests = ShippingRequest.all
	end

	def edit
	  @shipping_request = ShippingRequest.find(params[:id])
	end

	def update
	  @shipping_request = ShippingRequest.find(params[:id])
	 
	 if @shipping_request.update_attributes(params[:shipping_request].permit(:service_id, :account_id, :bill_number, :request_date, :required_shipment_date, :contact, :details, :simple_shipment))
		redirect_to @shipping_request
	  else
		render 'edit'
	 end
	end

	def destroy
	  @shipping_request = ShippingRequest.find(params[:id])
	  @shipping_request.destroy
	 
	  redirect_to shipping_requests_path
	end
	
end
