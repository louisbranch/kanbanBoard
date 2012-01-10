class StatusesController < ApplicationController
  before_filter :load_project

  def new
    @status = @project.statuses.build
  end

  def create
    @status = @project.statuses.build(params[:status])
    if @status.save
      flash[:notice] = 'Status was created!'
      redirect_to @project
    else
      render :new
    end
  end

  private

  def load_project
    @project = Project.find(params[:project_id])
  end

end

