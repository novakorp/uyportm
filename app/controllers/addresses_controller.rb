class AddressesController < ApplicationController
	def new		
		@customer = Customer.find(params[:customer_id])
		@address = @customer.addresses.build 
	end
	
	def create
		@customer = Customer.find(params[:customer_id])
		@address = Address.new(params[:address])
		@address.customer_id = @customer.id
		
	  if @address.save
		 redirect_to  @customer 
	  else
		render 'new'
	  end
	end

	def show
	  @address = Address.find(params[:id])
	end

	def edit
	  @address = Address.find(params[:id])	  
	end

	def update
	  @address = Address.find(params[:id])	 
	  @customer = @address.customer
	 
	 if @address.update_attributes(params[:address].permit(:description, :address_detail_1, :address_detail_2, :postal_code, :location_id, :phone_number_1, :phone_number_2, :comments))
		redirect_to @customer
	  else
		render 'edit'
	 end
	end

	def destroy
	  @address = Address.find(params[:id])	
	  @customer = @address.customer
	  @address.destroy
	 
	  redirect_to @customer
	end
	
end
