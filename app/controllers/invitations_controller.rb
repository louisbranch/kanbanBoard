class InvitationsController < ApplicationController
  
  def create
    @receiver = params[:email]
    @project = Project.find(params[:project_id])
    unless @project.invitations.for?(@receiver)
      @invitation = Invitation.new( :user => current_user, :project => @project, :email => @receiver)
      if @invitation.save
        UserMailer.invite(current_user.id, @receiver, @project.id).deliver
        flash[:notice] = "An invitation has been sent to #{@receiver}"
      end
    else
      flash[:error] = "#{@receiver} was already invited!"
    end
    redirect_to project_members_path(@project)
  end
  
  def update
    @invitation = Invitation.find(params[:id])
    if @invitation.project.users << current_user
      @invitation.destroy
      flash[:notice] = "Project added!"
    end
    redirect_to projects_path
  end
  
  def destroy
    @invitation = Invitation.find(params[:id])
    @invitation.destroy
    redirect_to projects_path
  end
  
end
