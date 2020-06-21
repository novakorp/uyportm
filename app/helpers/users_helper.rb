module UsersHelper
  
  # Actualiza los roles de un usuario. 
  # Recibe un hash con los roles recibidos por parametro en el controller.
  def users_h_update_user_roles(p_user, p_param_checked_roles)
    
    # roles disponibles
    roles = Role.all
    
    roles.each do |role|  
            
      # determinar si el rol esta asociado al usuario
      usr_role_array=p_user.roles.select {|usr_role| usr_role.id == role.id}
      
       
      if usr_role_array.length > 0
          usr_role=usr_role_array.first    
      else 
          usr_role=nil     
      end           
          
      if p_param_checked_roles[role.id.to_s]  
        # si el rol actual fue seleccionado, agregar una asociacion en caso que no exista 
        if ! usr_role  
          UserRole.create(role_id: role.id, user_id: p_user.id)
        end
      else  
        
        # el rol actual no esta seleccionado, si estaba asignado al usuaro, eliminar la asociacion 
        if usr_role 
          
          # obtener asociaciones para el rol y eliminarlas
          role_asoc_array=p_user.user_roles.select {|role_asoc| role_asoc.role_id == usr_role.id}
          
          role_asoc_array.each do |role_asoc_dest|
             
            role_asoc_dest.destroy
          end
          
        end  
        
      end 
    end 
    
  end
  
  def user_h_has_role(p_user, p_role_name)
     
    role_array=p_user.user_roles.select {|user_role| user_role.role.name == p_role_name}
    
    return (role_array.length > 0)
    
  end
  
  
  
end


