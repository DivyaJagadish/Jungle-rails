class User < ActiveRecord::Base
   has_secure_password
   validates :email, uniqueness: {case_sensitive: false}, presence: true
   validates :firstname, presence: true
   validates :lastname, presence: true
   validates :password, length: { minimum: 8}

   def self.authenticate_with_credentials(email,password)
        @user = User.find_by_email(email)
        if @user && @user.authenticate(password)
        return @user
        else
        return nil
        end
  end
    
end
