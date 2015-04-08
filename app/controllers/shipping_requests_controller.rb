class ShippingRequestsController < ApplicationController
	def new
    
    # variable con la ruta que debe usar la accion "volver" del formulario
    @back_option=get_back_option
    
		@shipping_request = ShippingRequest.new
	end
	
	def create
	  @shipping_request = ShippingRequest.new(params[:shipping_request])
    @shipping_request.customer_shipping_order_id = params[:customer_shipping_order_id]
    
    msr = MShippingRequest.find(@shipping_request.m_shipping_request)
    @shipping_request.service_id = msr.service_id
    @shipping_request.trip_id = msr.trip_id
    
    
    @back_option=get_back_option
    
	  if @shipping_request.save
      redirect_to @shipping_request
	  else
      render 'new'
	  end
	end

	def show  
    
    # variable con la ruta que debe usar la accion "volver" del formulario
    @back_option=get_back_option
  
	  @shipping_request = ShippingRequest.find(params[:id])
	end

	def index
	  @shipping_requests = ShippingRequest.all
	end

	def edit
    # variable con la ruta que debe usar la accion "volver" del formulario
    @back_option=get_back_option
    
	  @shipping_request = ShippingRequest.find(params[:id])    
	end

	def update
	  @shipping_request = ShippingRequest.find(params[:id])
	 
   @back_option=get_back_option
   
	 if @shipping_request.update_attributes(params[:shipping_request].permit(:m_shipping_request_id, :service_id, :trip_id, :trip_quantity, :cargo_type_id, :cargo_quantity, :measure_unit_id))
      
      redirect_to @shipping_request
      
	 else
      render 'edit'
	 end
	end

	def destroy
	  @shipping_request = ShippingRequest.find(params[:id])
	  @shipping_request.destroy
	 
    # variable con la ruta que debe usar la accion "volver" del formulario
    @back_option=get_back_option
    
	  redirect_to @back_option
    
	end
  
  	 
  
  # Devuelve el valor asignado en la variable de sesion :back_option, que indica donde se debe ir con la accion Volver.
  def get_back_option
    b_opt = session[:back_option]

    if b_opt == nil
      b_opt= customer_shipping_orders_path + "/pending_requests"
    end
    
    return b_opt
  end
  
	
end
