class Invitation < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  delegate :name, :to => :user, :prefix => true
  delegate :name, :to => :project, :prefix => true

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

