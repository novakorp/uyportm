class ShippingRequestsController < ApplicationController
	def new    
	    
	 @customer_shipping_order  = CustomerShippingOrder.find(params[:customer_shipping_order_id])
	 @shipping_request = @customer_shipping_order.shipping_requests.build 
	
	# @shipping_request = ShippingRequest.new	 
	# @shipping_request.customer_shipping_order_id = params[:customer_shipping_order_id]
		
	end
	
	def create
	  
	  puts params.to_s
	  puts "*************  CUSTOMER SH ORDER ID = " + params[:customer_shipping_order_id]  + "  *****************"
	  
	  @customer_shipping_order = CustomerShippingOrder.find(params[:customer_shipping_order_id])
	  @shipping_request = @customer_shipping_order.shipping_requests.create(obj_params)
	  
    #@shipping_request.customer_shipping_order_id = params[:customer_shipping_order_id]
        


    puts "**************  SAVE SR **********************"  
    
	  @shipping_request.save
    
    puts "**************  REDIRECT TO CSO  2 **********************"  
	  #  redirect_to @shipping_request.customer_shipping_order
	  
	  redirect_to :controller => :customer_shipping_orders, :action => :show, :id => @shipping_request.customer_shipping_order_id.to_s
	  
	end

	def show  
  
	  @shipping_request = ShippingRequest.find(params[:id])
	end

	def index
	  @shipping_requests = ShippingRequest.all
	end

	def edit    
	  
	  @shipping_request = ShippingRequest.find(params[:id])
	  @customer_shipping_order = @shipping_request.customer_shipping_order    
	end
 
	def update
	  @shipping_request = ShippingRequest.find(params[:id])
	  
   
	 if @shipping_request.update_attributes(params[:shipping_request].permit(:m_shipping_request_id, :service_id, :trip_id, :trip_quantity, :cargo_type_id, :cargo_quantity, :measure_unit_id, :schedule))
      
      redirect_to @shipping_request
      
	 else
      render 'edit'
	 end
	end

	def destroy
	  
	  puts "----------- DESTROY SR -----------"
	  
	  @shipping_request = ShippingRequest.find(params[:id])
	  
	  @cso = @shipping_request.customer_shipping_order
	  @shipping_request.destroy
	  
    
    @action_result_code="1"
    @action_result_desc="OK"
    @action_result_data="{}"
    
	  
    respond_to do |format|
      format.html { redirect_to shipping_requests_path }
      format.js { render "/common/action_result.js" }
    end
    
	end
  
  	 
   
  
	
  def obj_params
    params.require(:shipping_request).permit(:m_shipping_request_id, :service_id, :trip_id, :trip_quantity, :cargo_type_id, :cargo_quantity, :measure_unit_id, :schedule)
  end
end
