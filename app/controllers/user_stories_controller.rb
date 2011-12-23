class UserStoriesController < ApplicationController
  before_filter :load_resources
  before_filter :authorize
  
  def new
    @user_story = @project.user_stories.build
    @statuses = Status.all
    @story_points = StoryPoint.all
  end
  
  def create
    @user_story = @project.user_stories.build(params[:user_story])
    if @user_story.save
      respond_to do |format|
        format.html { redirect_to @project, :notice => 'User Story Created!'}
        format.js { @user_story }
      end
    else
      show_errors(@user_story)
      render :new
    end
  end
  
  def edit
    @user_story = UserStory.find(params[:id])
    @statuses = Status.all
    @story_points = StoryPoint.all
  end
  
  def update
    @user_story = UserStory.find(params[:id])
    if @user_story.update_attributes(params[:user_story])
      respond_to do |format|
        format.html { redirect_to @project, :notice => 'User Story Updated!'}
        format.js { @user_story }
      end
    else
      show_errors(@user_story)
      render :edit
    end
  end
  
  def destroy
    @user_story = UserStory.find(params[:id])
    if @user_story.destroy
      redirect_to @project, :notice => 'User Story Deleted!'
    else
      show_errors(@user_story)
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
  end
  
end
