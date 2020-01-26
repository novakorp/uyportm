class DefaultMailer < ActionMailer::Base
  default from: "Notificaciones Odacor"
   
  
   def email_venc_sucta(user)
      # Obtener alertas a mostrar
    ag = AlertGenerator.new    
    @sucta_vencidos = ag.get_alerts_sucta_expired
    @sucta_a_vencer = ag.get_alerts_sucta_to_expire
     
    #  !!!!!!
    #  CAMBIAR : Enviar correo a todos los usuarios que reciban notificaciones
    
     
    @user = user
    mail(to: @user.email, subject: 'Vencimientos SUCTA')
  end
end
