class CustomerShippingOrdersController < ApplicationController

	def new
      # obtener destino para la accion volver
      @back_option=get_back_option()
  
      @customer_shipping_order = CustomerShippingOrder.new
        
      @customer_shipping_order.order_datetime = l(Time.now, :format => :short_dp)
      @customer_shipping_order.shipping_date = l(DateTime.now.tomorrow.to_date, :format => :short_dp)
      
	end
	
	def create
     # obtener destino para la accion volver
      @back_option=get_back_option()
  
	  @customer_shipping_order = CustomerShippingOrder.new(params[:customer_shipping_order])
     
    # Verificar que se ingresaron datos correctamente
    
    
    valid = @customer_shipping_order.valid?
        
    if valid
        sh_reqs = params[:sr]
      
        sh_reqs.each do |key, value|                          
            if (value[:m_shipping_request_select] == 'otro')                
                if value[:service_id] == ''
                   @customer_shipping_order.errors.add("shipping_requests", t("activerecord.attributes.shipping_request.service_id") + ": " + t("errors.messages.blank"))
                    valid = false
                end
                
                if value[:trip_id] == ''
                   @customer_shipping_order.errors.add("shipping_requests", t("activerecord.attributes.shipping_request.trip_id") + ": " + t("errors.messages.blank"))
                    valid = false
                end
                                          
            else
                 if value[:m_shipping_request_id] != ''    
                   msr = MShippingRequest.find(value[:m_shipping_request_id])       
                 
                   if ! (msr != nil && value[:trip_quantity] != '' && value[:cargo_type_id] != '' && value[:cargo_quantity] != '' && value[:measure_unit_id] != '')
                      valid = false
                   
                      @customer_shipping_order.errors.add("shipping_requests", "Hay líneas de pedido incorrectas")
                   end
                end
            end     
        end
        
    end 
    
    if !(valid)
      #redirect_to '/customer_shipping_orders/new'
      flash[:sr]=sh_reqs
      render 'new'
      return
    end
    
     
	  if @customer_shipping_order.save
      
        sh_reqs = params[:sr]
      
        sh_reqs.each do |key, value|
            if (value[:m_shipping_request_id] == '') && (value[:service_id] != '')
                sr = ShippingRequest.new
                sr.customer_shipping_order_id = @customer_shipping_order.id
                                
                sr.service_id = value[:service_id]
                sr.trip_id = value[:trip_id]
                
                sr.trip_quantity = value[:trip_quantity]
                sr.cargo_type_id = value[:cargo_type_id]
                sr.cargo_quantity = value[:cargo_quantity]
                sr.measure_unit_id = value[:measure_unit_id]    

                sr.save
            elsif value[:m_shipping_request_id] != '' 
                sr = ShippingRequest.new
                sr.customer_shipping_order_id = @customer_shipping_order.id
                sr.m_shipping_request_id = value[:m_shipping_request_id]
                
                msr = MShippingRequest.find(value[:m_shipping_request_id])
                sr.service_id = msr.service_id
                sr.trip_id = msr.trip_id
                
                sr.trip_quantity = value[:trip_quantity]
                sr.cargo_type_id = value[:cargo_type_id]
                sr.cargo_quantity = value[:cargo_quantity]
                sr.measure_unit_id = value[:measure_unit_id]    

                sr.save
            end
            
        end

        redirect_to @customer_shipping_order   
      
	  else
        render 'new'
	  end
	end

	def show
    # obtener destino para la accion volver
    @back_option=get_back_option() 
  
	  @customer_shipping_order = CustomerShippingOrder.find(params[:id])
    
    @sel_line_id = (params[:sel_line_id])
    
    
	end

	def index
	  @customer_shipping_orders = CustomerShippingOrder.all
	end

	def edit
    # obtener destino para la accion volver
    @back_option=get_back_option()
    
	  @customer_shipping_order = CustomerShippingOrder.find(params[:id])
	end
  
	def pending_requests
    #  Setea la variable back_option en la sesion, con la ruta a la lista indicada
    set_list_in_session "pending_requests"
  
    @shipping_requests = ShippingRequest.find_by_sql("Select * from customer_shipping_orders c inner join shipping_requests r on c.id = r.customer_shipping_order_id
        where r.trip_quantity > (select count(*) from shipments s where s.shipping_request_id = r.id and s.status >= 3) order by c.order_number ASC, c.created_at ASC")
  
	   # @shipping_requests = ShippingRequest.joins(:customer_shipping_order).order("customer_shipping_orders.order_number ASC, customer_shipping_orders.created_at ASC")
	end


	def completed_requests
    #  Setea la variable back_option en la sesion, con la ruta a la lista indicada
    set_list_in_session "completed_requests"
  
    @shipping_requests = ShippingRequest.find_by_sql("Select * from customer_shipping_orders c inner join shipping_requests r on c.id = r.customer_shipping_order_id
        where ((select count(*) from shipments s where s.shipping_request_id = r.id and s.status >= 3) = 
        (select count(*) from shipments s where s.shipping_request_id = r.id)) and
        ((select count(*) from shipments s where s.shipping_request_id = r.id) > 0 ) order by c.order_number ASC, c.created_at ASC")
  
	   # @shipping_requests = ShippingRequest.joins(:customer_shipping_order).order("customer_shipping_orders.order_number ASC, customer_shipping_orders.created_at ASC")
	end

  
	def update
    # obtener destino para la accion volver
    @back_option=get_back_option()
    
	  @customer_shipping_order = CustomerShippingOrder.find(params[:id])
	 
	 if @customer_shipping_order.update_attributes(params[:customer_shipping_order].permit(:customer_id, :company_id, :order_datetime, :shipping_date, :comments))
		redirect_to @customer_shipping_order
	  else
		render 'edit'
	 end
	end

	def destroy
    # obtener destino para la accion volver
    @back_option=get_back_option()
    
	  @customer_shipping_order = CustomerShippingOrder.find(params[:id])
	  @customer_shipping_order.destroy
	 
	  redirect_to back_option
	end
	 
  #  Setea la variable back_option en la sesion, con la ruta a la lista indicada
  def set_list_in_session(list_name)
    session[:back_option]="/customer_shipping_orders/" + list_name
  end
   
   
  # Devuelve el valor asignado en la variable de sesion :back_option, que indica donde se debe ir con la accion Volver.
  def get_back_option
    b_opt = session[:back_option]

    if b_opt == nil
      b_opt=@customer_shipping_order
    end
    
    return b_opt
  end
	
   
end
