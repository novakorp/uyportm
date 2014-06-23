class MRequestedCargosController < ApplicationController
	def new		
		@m_shipping_request = MShippingRequest.find(params[:m_shipping_request_id])
		@m_requested_cargo = @m_shipping_request.m_requested_cargos.build 
	end
	
	def create
		@m_shipping_request = MShippingRequest.find(params[:m_shipping_request_id])
		@m_requested_cargo = MRequestedCargo.new(params[:m_requested_cargo])
		@m_requested_cargo.m_shipping_request_id = @m_shipping_request.id
		
	  if @m_requested_cargo.save
		 redirect_to  @m_shipping_request 
	  else
		render 'new'
	  end
	end

	def show
	
	  @m_requested_cargo = MRequestedCargo.find(params[:id])
	  @m_shipping_request = @m_requested_cargo.m_shipping_request
	end

	def edit
	  @m_requested_cargo = MRequestedCargo.find(params[:id])	  
	end

	def update
	  @m_requested_cargo = MRequestedCargo.find(params[:id])	 
	  @m_shipping_request = @m_requested_cargo.m_shipping_request
	 
	 if @m_requested_cargo.update_attributes(params[:m_requested_cargo].permit(:ammount, :cargo_type_id, :measure_unit_id))
		redirect_to @m_shipping_request
	  else
		render 'edit'
	 end
	end

	def destroy
	  @m_requested_cargo = MRequestedCargo.find(params[:id])	
	  @m_shipping_request = @m_requested_cargo.m_shipping_request
	  @m_requested_cargo.destroy
	 
	  redirect_to @m_shipping_request
	end
	
end
