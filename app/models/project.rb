class Project < ActiveRecord::Base
  has_many :statuses, :dependent => :destroy
  has_many :user_stories, :dependent => :destroy
  has_many :memberships, :dependent => :destroy
  has_many :invitations, :dependent => :destroy
  has_many :users, :through => :memberships

  after_create :create_backlog

  validates :name, :presence => true
  validates :description, :presence => true

  def member?(user)
    users.exists?(user.id)
  end

  def remove_member(user)
    memberships.where('user_id = ?', user.id).first.destroy
  end

  def create_backlog
    statuses.create( :name => 'Backlog')
  end

end

