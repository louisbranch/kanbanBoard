class User < ActiveRecord::Base
  authenticates_with_sorcery!
  attr_accessible :name, :email, :password, :password_confirmation
  
  validates :password,  :presence => true,
                        :length => 3..20,
                        :confirmation => true
  validates :email,     :presence => true,
                        :format => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i,
                        :uniqueness => {:case_sensitive => false}
end
