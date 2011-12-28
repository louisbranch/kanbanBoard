class MembersController < ApplicationController
  load_and_authorize_resource :project
  before_filter :load_resources
  
  def index
    @members = @project.users
  end
  
  def destroy
    @member = User.find(params[:id])
    if @project.remove_member(@member)
      redirect_to project_members_path, :notice => 'Member removed!'
    else
      render :index
    end
  end
  
  private
  
  def load_resources
    @project = Project.find(params[:project_id])    
  end
  
end
