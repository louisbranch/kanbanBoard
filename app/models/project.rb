class Project < ActiveRecord::Base
  has_many :statuses, :dependent => :destroy
  has_many :user_stories, :dependent => :destroy
  has_many :memberships, :dependent => :destroy
  has_many :invitations, :dependent => :destroy
  has_many :users, :through => :memberships

  accepts_nested_attributes_for :statuses, :reject_if => lambda { |s| s[:name].blank? }, :allow_destroy => true

  validates :name, :presence => true
  validates :description, :presence => true

  def member?(user)
    users.exists?(user.id)
  end

  def remove_member(user)
    memberships.where('user_id = ?', user.id).first.destroy
  end

end

