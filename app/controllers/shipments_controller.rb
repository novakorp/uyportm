class ShipmentsController < ApplicationController
 
	def new
  
		@shipping_request = ShippingRequest.find(params[:id])
		@shipment = Shipment.new
		@shipment.shipping_request_id = (params[:id])
    
    @other_shipments = Shipment.where({shipping_request_id: @shipping_request.id}).order("departure_time desc")
	end
	
	def create
    
	  @shipment = Shipment.new(obj_params)

	  if @shipment.save
	    supplies = (params[:supplies])
	  	supplies.each do |sup_key, sup_val|
      
        if sup_val[:address] != "" && sup_val[:amount] != ""
          sup = ShipmentSupply.new
          
          sup.shipment_id = @shipment.id
          sup.amount = sup_val[:amount].to_i
          sup.address_id = sup_val[:address].to_i
          sup.save
        end
        
      end
	  
	    deliveries = (params[:deliveries])
	  	deliveries.each do |del_key, del_val|
        if del_val[:address] != "" && del_val[:amount] != ""
          del = ShipmentDelivery.new
          
          del.shipment_id = @shipment.id
          del.amount = del_val[:amount].to_i			
          del.address_id = del_val[:address].to_i
          del.save
        end
      end
	  
      redirect_to "/customer_shipping_orders/pending_requests"
		
	  else
      render 'new'
	  end
	end

	def show
  
	  @shipment = Shipment.find(params[:id])
    @shipping_request = @shipment.shipping_request;
    	  
	  @supplies = ShipmentSupply.joins(:address).where(shipment_id: params[:id]).order('addresses.description')
	  @deliveries = ShipmentDelivery.joins(:address).where(shipment_id: params[:id]).order('addresses.description')   
    
	end
  
	def index
	  @shipments = Shipment.all
	end
  
 
  
	def pending
  
    # Asignar destino para accion volver en la sesion
    set_list_in_session("pending")
    
	  @shipments = Shipment.where(:status => (1..2)).order(:departure_time)
	end

	def completed
    # Asignar destino para accion volver en la sesion
    set_list_in_session("completed")
      
	  @shipments = Shipment.where(:status => (3..3))
	end
    
	def bill_pending
  
    # Asignar destino para accion volver en la sesion
    set_list_in_session("bill_pending")
    
	  @shipments = Shipment.where(:status => (4..4))
	end
    
	def by_date
    set_list_in_session("by_date")
	  @shipments = Shipment.all
	end

	def edit
    
	  @shipment = Shipment.find(params[:id])
    @shipping_request=@shipment.shipping_request   
	end

  def ajax_update
    @shipment = Shipment.find(params[:id])
    
    if params[:status] != nil 
      @shipment.status = params[:status]
      
    elsif params[:remito] != nil
      @shipment.remito = params[:remito]
      @shipment.status = 4
    end
    
    @shipment.save
    
    render nothing: true
  end
  
	def update
    
	  @shipment = Shipment.find(params[:id])
	 
	 if @shipment.update_attributes(params[:shipment].permit(:shipping_request_id, :departure_time, :arrival_time, :status, :vehicle_id, :coupled_vehicle_id, :driver_id, :comments ))
      
      supplies = (params[:supplies])
	  	supplies.each do |sup_key, sup_val|
        if sup_val[:id] != "" 
          sup = ShipmentSupply.find(sup_val[:id])
        elsif sup_val[:address] != "" && sup_val[:amount] != ""
          sup = ShipmentSupply.new
          sup.id = @shipment.id
        else 
          sup = nil
        end
        
        if sup 
          sup.amount = sup_val[:amount].to_i		
          sup.address_id = sup_val[:address].to_i
          sup.save 
        end
      end
	  
	    deliveries = (params[:deliveries])
	  	deliveries.each do |del_key, del_val|
      
      
        if del_val[:id] != "" 
          del = ShipmentDelivery.find(del_val[:id])
          
        elsif del_val[:address] != "" && del_val[:amount] != ""
          del = ShipmentDelivery.new
          del.shipment_id = @shipment.id
        else 
          del = nil
        end
         
        if del 
          del.amount = del_val[:amount].to_i			
          del.address_id = del_val[:address].to_i
          del.save
        end
      end  
    
     
	 else
	   
		render 'edit'
	 end
	end

	def destroy
	  @shipment = Shipment.find(params[:id])
    @shipment.destroy
	 
    @action_result_code="1"
    @action_result_desc="OK"
    @action_result_data="{}"
      
    respond_to do |format|
      format.html { redirect_to shipments_path }
      format.js { render "/common/action_result.js" }
    end 
	end
  
  
  #  Setea la variable back_option en la sesion, con la ruta a la lista indicada
  def set_list_in_session(list_name)
    session[:back_option]="/shipments/" + list_name
    
  end
   
   
  # Devuelve el valor asignado en la variable de sesion :back_option, que indica donde se debe ir con la accion Volver.
  def get_back_option
    b_opt = session[:back_option]

    if b_opt == nil
      b_opt=@shipment
    end
    
    return b_opt
  end
  
   
   
	def list_documents
		@documents  = Shipment.find(params["shipment_id"]).shipment_documents
    
    
	  respond_to do |format|
      format.js 
      format.html
	  end
	end
	
	
	
  def planning
    if params[:date_select]
    
      @date_select = params[:date_select]
      @listing_date = Date.strptime(params[:date_select], '%d-%m-%Y')
      
    else
    
      @listing_date = Date.today
      @date_select = @listing_date.strftime("%d-%m-%Y")
      
    end
    
    @shipments = []
    
    if @listing_date >= Date.today
    
      @vehicles = Vehicle.where("type_group in [1,5]")
      @shipments = Shipment.where("departure_time >=? and departure_time <? ", @listing_date, @listing_date+1)
      
    end
    
    
    
  end

  private

  def obj_params
    params.require(:shipment).permit(:shipping_request_id, :departure_time, :arrival_time, :status, :vehicle_id, :coupled_vehicle_id, :driver_id, :comments )
  end
    
end



