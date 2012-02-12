class Membership < ActiveRecord::Base
  after_destroy :destroy_orphan_projects

  belongs_to :project
  belongs_to :user

  validates :project_id, :presence => true
  validates :user_id, :presence => true

  private

  def destroy_orphan_projects
    if project.memberships.empty?
      project.destroy
    end
  end

end
