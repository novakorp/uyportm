
#  Se encarga de generar alertas para mostrar al usuario.

class AlertGenerator 
	
  # Devuelve un array de alertas. Cada alerta es un hash que contiene un elemento texto y uno url.
  def get_alerts
      
   expired_return = get_alerts_sucta_expired
     
    
   to_expire_return = get_alerts_sucta_to_expire 
    
   return  expired_return + to_expire_return       
  end
  
  
  def get_alerts_sucta_to_expire
    alerts = []
    
    # Vencimientos de SUCTA proximos 5 dias
    date_limit = Date.today + 5
    suctas = SuctaRegistration.where("expiration >= ? AND expiration <= ?", Date.today, date_limit)
    
    if suctas 
      suctas.each do |item|
      
        alerta={"texto" => "SUCTA de " + item.vehicle.plate_number.to_s + " expira el " + I18n.l(item.expiration.to_date), 
            "url" => "/vehicles/" + item.vehicle_id.to_s}       
        alerts << alerta
      end
     end
     
     return alerts
  end
  
  def get_alerts_sucta_expired
     alerts = []
     
       
    # Vencimientos de SUCTA exipirados
    date_limit = Date.today - 5
    suctas = SuctaRegistration.where("expiration < ? AND expiration >= ?", Date.today, date_limit)
   
    if suctas 
      suctas.each do |item|
      
        if item.vehicle 
          alerta={"texto" => "SUCTA de " + item.vehicle.plate_number.to_s + " expiró el " + I18n.l(item.expiration.to_date), 
              "url" => "/vehicles/" + item.vehicle_id.to_s}     
        end
        
        alerts << alerta
      end
    end 
    
    return alerts
  end
  
  
  
end
