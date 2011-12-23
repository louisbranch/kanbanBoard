class UserStory < ActiveRecord::Base
  belongs_to :project
  belongs_to :status
  belongs_to :story_point
  acts_as_list :scope => :status
  
  scope :by_status, lambda { |status| where("status_id = ?", status)}
  scope :by_project, lambda { |project| where("project_id = ?", project)}
  
  def points
    if story_point
      story_point.value
    else
      '?'
    end      
  end
  
end
