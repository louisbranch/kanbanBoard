class Status < ActiveRecord::Base
  belongs_to :project
  has_many :user_stories, :order => "position", :dependent => :destroy

  validates :name, :presence => true

  def availability
    if wip
      wip - user_stories.count
    end
  end

end

