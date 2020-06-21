class User < ActiveRecord::Base
	include UsersHelper
	
  has_many :user_roles
	has_many :roles, through: :user_roles 
	
	
	before_save { self.email = email.downcase }
	
	validates :name,  :presence => true, length: { maximum: 50 }
	#validates :email, :presence => true, 	format: { with: /^(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})$/i }, uniqueness: { case_sensitive: false }
					
	has_secure_password
	
  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end
  
  def has_role(p_role_name)
    return user_h_has_role(self, p_role_name)
  end

  private

    def create_remember_token
      self.remember_token = User.digest(User.new_remember_token)
    end
end
