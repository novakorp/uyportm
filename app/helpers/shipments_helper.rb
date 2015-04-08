module ShipmentsHelper
  def getShipmentStatusDesc(status)
  
    if status == 0
		  desc = "Anulado"
    elsif status == 1
		  desc = "Agendado"
		elsif status == 2
		  desc = "En Curso"
		elsif status == 3 
		  desc = "Completado"
		elsif status == 4 
		  desc = "Para Facturar"
		elsif status == 5
      desc = "Finalizado"
    elsif status == 6
      desc = "Cancelado"
    end 
    
    return desc
  end
end
