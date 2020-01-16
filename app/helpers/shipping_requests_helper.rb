module ShippingRequestsHelper
  
  def get_sr_schedule_description (schedule_value) 
    case schedule_value
      when 1
         return "1 - Primera Hora" 
      when 2
        return "2 - Mañana"
      when 3 
        return "3 - Media Tarde"        
      when 4
        return "4 - Ultima Hora"
      else
        return ""
    end
  end
              
    
  
end
