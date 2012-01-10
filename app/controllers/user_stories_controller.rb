class UserStoriesController < ApplicationController
  before_filter :require_login
  load_and_authorize_resource :project
  load_and_authorize_resource :user_story, :through => :project
  before_filter :load_resources

  def new
    @user_story = @project.user_stories.build
  end

  def create
    @user_story = @project.user_stories.build(params[:user_story])
    if @user_story.save
      respond_to do |format|
      format.html { redirect_to @project, :notice => 'User Story Created!'}
      format.js { @user_story }
      end
    else
      respond_to do |format|
      format.html { render :new }
      format.js { @user_story }
      end
    end
  end

  def edit
    @user_story = UserStory.find(params[:id])
  end

  def update
    @user_story = UserStory.find(params[:id])
    if @user_story.update_attributes(params[:user_story])
      respond_to do |format|
      format.html { redirect_to @project, :notice => 'User Story Updated!'}
      format.js { @user_story }
      end
    else
      respond_to do |format|
      format.html { render :edit }
      format.js { @user_story }
      end
    end
  end

  def destroy
    @user_story = UserStory.find(params[:id])
      if @user_story.destroy
      respond_to do |format|
      format.html { redirect_to @project, :notice => 'User Story Deleted!'}
      format.js { @user_story }
      end
    else
      redirect_to @project
    end
  end

  def update_status
    if params[:status] && params[:user_story]
      status = params[:status]
      params[:user_story].each_with_index do |id, index|
        UserStory.update_all({status_id: status, position: (index+1)},{id: id})
      end
    end
    render nothing: true
  end

  private

  def load_resources
    @project = Project.find(params[:project_id])
    @statuses = @project.statuses
    @story_sizes = StorySize.all
  end

end

