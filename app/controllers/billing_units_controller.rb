class BillingUnitsController < ApplicationController
	def new
		@billing_unit = BillingUnit.new
	end
	
	def create
	  @billing_unit = BillingUnit.new(params[:billing_unit])

	  if @billing_unit.save
		redirect_to @billing_unit
	  else
		render 'new'
	  end
	end

	def show
	  @billing_unit = BillingUnit.find(params[:id])
	end

	def index
	  @billing_units = BillingUnit.all
	end

	def edit
	  @billing_unit = BillingUnit.find(params[:id])
	end

	def update
	  @billing_unit = BillingUnit.find(params[:id])
	 
	 if @billing_unit.update_attributes(params[:billing_unit].permit(:code, :description))
		redirect_to @billing_unit
	  else
		render 'edit'
	 end
	end

	def destroy
	  @billing_unit = BillingUnit.find(params[:id])
	  @billing_unit.destroy
	 
	  redirect_to billing_units_path
	end
	
end
