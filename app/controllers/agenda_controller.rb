class AgendaController < ApplicationController
  
  layout "agenda"
   
  def agenda
    
    if params[:agenda_date_select]
    
      @agenda_date_select = params[:agenda_date_select]
      @agenda_date = Date.strptime(params[:agenda_date_select], '%d-%m-%Y')
      
    else
    
      @agenda_date = Date.today 
      @agenda_date_select = @agenda_date.strftime("%d-%m-%Y")
      
    end
    
    @shipments = Shipment.where("departure_time >=? and departure_time <? ",@agenda_date,@agenda_date+1)
    
    
    types_range = 1..3
    
    @vehicles = Vehicle.joins(:vehicle_type).where(vehicle_types: { type_group: types_range , coupling_support: 0}, vehicles: {status: 1}).order(:plate_number)
    
    
    @shipping_requests = ShippingRequest.find_by_sql("Select * from customer_shipping_orders c inner join shipping_requests r on c.id = r.customer_shipping_order_id
        where  c.shipping_date = '" + @agenda_date.strftime("%Y-%m-%d") + "' order by c.order_number ASC, c.created_at ASC")
  
    @agenda_vehicles_list = @vehicles
  
     # @shipping_requests = ShippingRequest.joins(:customer_shipping_order).order("customer_shipping_orders.order_number ASC, customer_shipping_orders.created_at ASC")
  end
  
  
  def assign_request
    
    puts params
    
    #  Crear un shipment para el shipping request y los parametros recibidos
    
    request_id = params[:request_id]
    vehicle_id = params[:vehicle_id]
    
    coupled_id = params[:coupled_vehicle_id]        
    driver_id = params[:driver_id]
    
    ship = Shipment.new
    
    ship.shipping_request_id = request_id.to_i
    ship.vehicle_id = vehicle_id.to_i
    
    if coupled_id != "" 
      ship.coupled_vehicle_id = coupled_id.to_i
    end
    
    ship.driver_id = driver_id
    ship.status = 1
    
    ship.save
     
     
    @action_result_code='"0"'
    @action_result_desc='"OK"'
    @action_result_data='{"shipment_id": "' + ship.id.to_s + '"}'
    
    
    render "/common/action_result"
    
  end
  
end


