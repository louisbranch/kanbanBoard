class User < ActiveRecord::Base
  authenticates_with_sorcery!
  has_many :memberships, :dependent => :destroy
  has_many :projects, :through => :memberships
  
  attr_accessible :name, :email, :password, :password_confirmation
  
  EMAIL_REGEX = /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i
  
  validates :name,      :presence => true
  
  validates :password,  :presence => true,
                        :length => 3..20,
                        :confirmation => true,
                        :on => :create
  validates :email,     :presence => true,
                        :format => EMAIL_REGEX,
                        :uniqueness => {:case_sensitive => false}
  
  def self.search(query)
    if query.match(EMAIL_REGEX)
     where('email = ?', query)
    else
      raise InvalidEmailFormat
    end
  end
  
  def invitations
    Invitation.search(email)
  end
  
  class InvalidEmailFormat < StandardError
  end
  
end
