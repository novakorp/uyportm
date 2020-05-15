module GpsChangesHelper
  
  def get_gps_ch_action_description (action)
    arr_vs = get_gps_ch_action_array
    
    if action <= arr_vs.length
      return arr_vs[action][0]
    end
  end
  
  def get_gps_ch_action_array
    vs = [["Sin Procesar",0], 
    ["Crear V",1],
    ["Actualizar V",2],
    ["No Actuar",3]
    ]
    
    return vs
  end

end   