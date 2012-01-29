class UserStory < ActiveRecord::Base
  belongs_to :project
  belongs_to :status
  belongs_to :story_size
  has_many :issues
  acts_as_list :scope => :status

  validates :name, :presence => true
  validates :description, :presence => true

  def size
    if story_size
      story_size.name.slice(0)
    else
      '?'
    end
  end

  def size_alias
    if story_size
      story_size.name.downcase.gsub(' ','_')
    end
  end

end
