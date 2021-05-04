class User < ActiveRecord::Base
   has_secure_password
   validates :email, uniqueness: {case_sensitive: false}, presence: true
   validates :firstname, presence: true
   validates :lastname, presence: true

end
