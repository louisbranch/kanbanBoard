class StatusesController < ApplicationController
  before_filter :load_project

  def index
    @statuses = @project.statuses
  end

  def new
    @status = @project.statuses.build
  end

  def create
    @status = @project.statuses.build(params[:status])
    if @status.save
      flash[:notice] = 'Status was created!'
      redirect_to project_statuses_path(@project)
    else
      render :new
    end
  end

  def edit
    @status = Status.find(params[:id])
  end

  def update
    @status = Status.find(params[:id])
    if @status.update_attributes(params[:status])
      flash[:notice] = 'Status was updated!'
      redirect_to project_statuses_path(@project)
    else
      render :edit
    end
  end

  def destroy
    @status = Status.find(params[:id])
    if @status.destroy
      flash[:notice] = 'Status was deleted!'
      redirect_to project_statuses_path(@project)
    else
      redirect_to project_statuses_path(@project)
    end
  end

  private

  def load_project
    @project = Project.find(params[:project_id])
  end

end

