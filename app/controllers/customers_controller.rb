class CustomersController < ApplicationController
	def new
		@customer = Customer.new
	end
	
	def create
	  @customer = Customer.new(params[:customer])

	  if @customer.save
		redirect_to @customer
	  else
		render 'new'
	  end
	end

	def show
	  @customer = Customer.find(params[:id])
	end

	def index
	  @customers = Customer.all
	end

	def edit
	  @customer = Customer.find(params[:id])
	end

	def update
	  @customer = Customer.find(params[:id])
	 
	 if @customer.update_attributes(params[:customer].permit(:name, :rut))
		redirect_to @customer
	  else
		render 'edit'
	 end
	end

	def destroy
	  @customer = Customer.find(params[:id])
	  @customer.destroy
	 
	  redirect_to customers_path
	end
	
	def customers_ac
		@customers  = Customer.find(:all,:conditions => ['name iLIKE ?', "%#{params[:term]}%"])
	end
	
end
