module VehiclesHelper
  
    def get_vehicle_status_description (status)
      arr_vs = get_vehicle_status_array
      
      if status <= arr_vs.length
        return arr_vs[status-1][0]
      end
    end
    
    def get_vehicle_status_array
      vs = [["En Actividad",1], 
      ["Para Validar",2],
      ["En Reparación",3],
      ["En Mantenimiento",4],
      ["Fuera de Actividad",5],
      ["Siniestrado",6],
      ["En Venta",7]]
      
      return vs
    end
    
    
  def sort_options
    
    # Devuelve opciones para sort 
    # Para prefijar una tabla (del join) usar "-" en vez de "."
    
    return [["Marca", "vehicle_brands-id/asc"],["Matricula", "plate_number/asc"],["Estado", "status/asc"]]
  end
  
end


