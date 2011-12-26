class Project < ActiveRecord::Base
  has_many :user_stories, :dependent => :destroy
  
  validates :name, :presence => true
  validates :description, :presence => true
end
