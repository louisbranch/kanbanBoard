class UserStory < ActiveRecord::Base
  belongs_to :project
  belongs_to :status
  belongs_to :story_size
  acts_as_list :scope => :status
  
  validates :name, :presence => true
  validates :description, :presence => true
  
  scope :by_status, lambda { |status| where("status_id = ?", status)}
  scope :by_project, lambda { |project| where("project_id = ?", project)}
  
  def size
    if story_size
      story_size.name.slice(0)
    else
      '?'
    end      
  end
  
end
