class Status < ActiveRecord::Base
  belongs_to :project
  has_many :user_stories, :order => "position", :dependent => :destroy

  validates :name, :presence => true

  default_scope :order => 'created_at ASC'

  def availability
    if wip
      wip - user_stories.count
    else
      "-"
    end
  end

end
