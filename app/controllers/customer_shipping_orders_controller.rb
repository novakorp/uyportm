class CustomerShippingOrdersController < ApplicationController

	def new
      
  
  
      ###    # cargar datos de pedidos pendientes a mostrar junto al form de nueva orden
      
      ###    pending_requests
  
      @customer_shipping_order = CustomerShippingOrder.new
        
      @customer_shipping_order.order_datetime = l(Time.now, :format => :short_dp)
      @customer_shipping_order.shipping_date = l(DateTime.now.tomorrow.to_date, :format => :short_dp)
      
	end
	
	def create  
	  @customer_shipping_order = CustomerShippingOrder.new(obj_params)
         
	  if @customer_shipping_order.save
      redirect_to @customer_shipping_order
    else
      if @customer_shipping_order.nil?
        
        @customer_shipping_order = CustomerShippingOrder.new
        
        puts 'error al guardar '
      end
      
      render 'new'            
    end 
           
	end 
	

	def show
  
  
	  @customer_shipping_order = CustomerShippingOrder.find(params[:id])
    
    @shipping_request = ShippingRequest.new  
    @shipping_request.customer_shipping_order_id = params[:id]
    
    @sh_requests = @customer_shipping_order.shipping_requests.order("schedule ASC, id ASC")
    
    render layout: "layout_base"
    
	end

	def index
	  @customer_shipping_orders = CustomerShippingOrder.all
	  
	end

	def edit
   
	  @customer_shipping_order = CustomerShippingOrder.find(params[:id])
	end
  
	def pending_requests
    
  
    @shipping_requests = ShippingRequest.find_by_sql("Select * from customer_shipping_orders c inner join shipping_requests r on c.id = r.customer_shipping_order_id
        where r.trip_quantity > (select count(*) from shipments s where s.shipping_request_id = r.id and s.status >= 3) order by c.order_number ASC, c.created_at ASC")
  
	   # @shipping_requests = ShippingRequest.joins(:customer_shipping_order).order("customer_shipping_orders.order_number ASC, customer_shipping_orders.created_at ASC")
	end


	def completed_requests
   
  
    @shipping_requests = ShippingRequest.find_by_sql("Select * from customer_shipping_orders c inner join shipping_requests r on c.id = r.customer_shipping_order_id
        where ((select count(*) from shipments s where s.shipping_request_id = r.id and s.status >= 3) = 
        (select count(*) from shipments s where s.shipping_request_id = r.id)) and
        ((select count(*) from shipments s where s.shipping_request_id = r.id) > 0 ) order by c.order_number ASC, c.created_at ASC")
  
	   # @shipping_requests = ShippingRequest.joins(:customer_shipping_order).order("customer_shipping_orders.order_number ASC, customer_shipping_orders.created_at ASC")
	end

  
	def update
        
	  @customer_shipping_order = CustomerShippingOrder.find(params[:id])
	 
	 if @customer_shipping_order.update_attributes(params[:customer_shipping_order].permit(:customer_id, :company_id, :order_datetime, :shipping_date, :comments))
		redirect_to @customer_shipping_order
	  else
		render 'edit'
	 end
	end

	def destroy
       
	  @customer_shipping_order = CustomerShippingOrder.find(params[:id])
	  @customer_shipping_order.destroy
	  
	 
    @action_result_code="1"
    @action_result_desc="OK"
    @action_result_data="{}"
	 
    render "/common/action_result.js"
	end
	 
  #  Setea la variable back_option en la sesion, con la ruta a la lista indicada
  def set_list_in_session(list_name)
    session[:back_option]="/customer_shipping_orders/" + list_name
  end
   
   
	
  private

  def obj_params
    params.require(:customer_shipping_order).permit(:customer_id, :company_id, :order_datetime, :shipping_date, :comments)
  end
   
end
