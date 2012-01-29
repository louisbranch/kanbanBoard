class IssuesController < ApplicationController
  before_filter :require_login
  load_and_authorize_resource
  before_filter :load_resources

  def new
    @issue = @user_story.issues.build
  end

  def create
    @issue = @user_story.issues.build(params[:issue])
    if @issue.save
     respond_to do |format|
      format.html { redirect_to @project, :notice => 'Issue was created!'}
      format.js { @issue }
      end
    else
      respond_to do |format|
      format.html { render :new }
      format.js { @issue }
      end
    end
  end

  def edit
    @issue = Issue.find(params[:id])
  end

  def update
    @issue = Issue.find(params[:id])
    if @issue.update_attributes(params[:issue])
     respond_to do |format|
      format.html { redirect_to @project, :notice => 'Issue was updated!'}
      format.js { @issue }
      end
    else
      respond_to do |format|
      format.html { render :edit }
      format.js { @issue }
      end
    end
  end

  def destroy
    @issue = Issue.find(params[:id])
    if @issue.destroy
     respond_to do |format|
      format.html { redirect_to @project, :notice => 'Issue was removed!'}
      format.js { @issue }
      end
    else
      respond_to do |format|
      format.html { render :edit }
      format.js { @issue }
      end
    end
  end

  private

  def load_resources
    @project = Project.find(params[:project_id])
    @user_story = UserStory.find(params[:user_story_id])
  end

end
