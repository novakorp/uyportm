class ServicesController < ApplicationController
	def new
		@service = Service.new
	end
	
	def create
	  @service = Service.new(params[:service])

	  if @service.save
		redirect_to @service
	  else
		render 'new'
	  end
	end

	def show
	  @service = Service.find(params[:id])
	end

	def index
	  @services = Service.all
	end

	def edit
	  @service = Service.find(params[:id])
	end

	def update
	  @service = Service.find(params[:id])
	 
	 if @service.update_attributes(params[:service].permit(:description, :billing_unit_id, :vehicle_type_id, :couple_type_id, :couple_required, :company_id))
		redirect_to @service
	  else
		render 'edit'
	 end
	end

	def destroy
	  @service = Service.find(params[:id])
	  @service.destroy
	 
	  redirect_to services_path
	end
	
end
