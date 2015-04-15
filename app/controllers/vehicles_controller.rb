require 'savon'


class VehiclesController < ApplicationController
	def new
		@vehicle = Vehicle.new
	end

	def create
	  @vehicle = Vehicle.new(params[:vehicle])

	  if @vehicle.save
		redirect_to @vehicle
	  else
		render 'new'
	  end
	end

	def show
	  @vehicle = Vehicle.find(params[:id]) 
	end

	def index
    
	  @vehicles = Vehicle.all
      
        
       @client = Savon.client(wsdl: 'http://190.64.141.170:8009/wcAdmin/services/ServiceDataBykom?wsdl', 
      endpoint: 'http://190.64.141.170:8009/wcAdmin/services/ServiceDataBykom.ServiceDataBykomHttpSoap12Endpoint/')
   
        #client = Savon.client(wsdl: 'http://localhost:3000/ServiceDataBykom.xml')
   
        @client.operations.to_s
	end

	def edit
	  @vehicle = Vehicle.find(params[:id])
	end

	def update
	  @vehicle = Vehicle.find(params[:id])
	 
	 if @vehicle.update_attributes(params[:vehicle].permit(:company_id, :vehicle_type_id, :vehicle_brand_id, :model, :number_plate, :comments))
		redirect_to @vehicle
	  else
		render 'edit'
	 end
	end

	def destroy
	  @vehicle = Vehicle.find(params[:id])
	  @vehicle.destroy
	 
	  redirect_to vehicles_path
	end

    
end
