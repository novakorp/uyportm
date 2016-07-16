

class ShipmentsController < ApplicationController

  
 
	def new
    @back_option=get_back_option
  
		@shipping_request = ShippingRequest.find(params[:id])
		@shipment = Shipment.new
		@shipment.shipping_request_id = (params[:id])
    
    @other_shipments = Shipment.where({shipping_request_id: @shipping_request.id}).order("departure_time desc")
	end
	
	def create
    @back_option=get_back_option
    
	  @shipment = Shipment.new(params[:shipment])

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
    @back_option=get_back_option
  
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
    @back_option=get_back_option
    
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
    @back_option=get_back_option
    
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
    
    redirect_to @back_option
	 else
		render 'edit'
	 end
	end

	def destroy
	  @shipment = Shipment.find(params[:id])
    @shipment.destroy
	 
	  redirect_to get_back_option
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
    
end



