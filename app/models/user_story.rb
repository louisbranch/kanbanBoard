class UserStory < ActiveRecord::Base
  belongs_to :project
  belongs_to :status
  acts_as_list :scope => :status
  
  scope :by_status, lambda { |status| where("status_id = ?", status)}
  
end
