class Status < ActiveRecord::Base
  has_many :user_stories, :order => "position"
  
  def alias
    name.downcase.gsub(' ','_')
  end
end
