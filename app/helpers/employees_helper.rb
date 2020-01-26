module EmployeesHelper
  
    def get_job_type_description (job_type)
      
      case job_type
        when 1
           return "Gerente" 
        when 2
          return "Encargado"
        when 3 
          return "Chofer"        
        when 4
          return "Administrativo"
        else
          return ""
      end
    end
  
end
