class WelcomeController < ApplicationController
  def index   
  
    # Obtener alertas a mostrar
    ag = AlertGenerator.new    
    @alerts = ag.get_alerts
    
    # Obtener pedidos recientes
    dateQry = Date.today-100     
    @pedidos = ShippingRequest.joins(:customer_shipping_order).where('order_datetime >= ?', dateQry).order('order_datetime DESC')
    
    
  end
  
  def configuration
  end
end
