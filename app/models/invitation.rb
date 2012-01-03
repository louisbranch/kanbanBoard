class Invitation < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  
  def self.search(email)
    where('email = ?', email)
  end
  
  def self.for?(email)
    if where('email = ?', email).any?
      true
    else
      false
    end
  end
  
end
