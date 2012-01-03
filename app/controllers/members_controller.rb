class MembersController < ApplicationController
  load_and_authorize_resource :project
  before_filter :load_resources

  rescue_from User::InvalidEmailFormat, :with => :invalid_email_format

  def index
    @members = @project.users
  end

  def new
    if params[:search]
      @search = params[:search]
      @members = User.search(@search)
    end
  end

  def create
    @member = User.find(params[:id])
    if @project.users << @member
      redirect_to project_members_path, :notice => 'Member added!'
    else
      render :new
    end
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

  def invalid_email_format
    flash.now[:error] = 'Email format is not valid.'
    render :new
  end

end

