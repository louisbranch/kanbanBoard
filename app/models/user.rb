class User < ActiveRecord::Base
  authenticates_with_sorcery!
  has_many :memberships, :dependent => :destroy
  has_many :projects, :through => :memberships
  
  attr_accessible :name, :email, :password, :password_confirmation
  
  validates :name,      :presence => true, :length => 3..20
  
  validates :password,  :presence => true,
                        :length => 3..20,
                        :confirmation => true,
                        :on => :create
  validates :email,     :presence => true,
                        :format => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i,
                        :uniqueness => {:case_sensitive => false}
end
