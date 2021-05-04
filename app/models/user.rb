class User < ActiveRecord::Base
   has_secure_password
   validates :email, uniqueness: true, case_senstive: false,presence: true
   validates :firstname, presence: true
   validates :lastname, presence: true

end
