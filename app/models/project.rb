class Project < ActiveRecord::Base
  has_many :user_stories, :dependent => :destroy
  has_many :memberships, :dependent => :destroy
  has_many :users, :through => :memberships
  
  validates :name, :presence => true
  validates :description, :presence => true
  
  def member?(user)
    users.exists?(user.id)
  end
  
  def members
    if users.count == 1
      'Only me'
    else
      users.map(&:name).join(", ")
    end
  end
  
end
