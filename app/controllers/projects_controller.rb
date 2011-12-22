class ProjectsController < ApplicationController
	
	def index
	  @projects = Project.all
	end
	
	def show
	  @project = Project.find(params[:id])
	  @statuses = Status.all
	end
	
	def new
	  @project = Project.new
	end
	
	def create
	  @project = Project.new(params[:project])
	  if @project.save
	    redirect_to projects_path, :notice => 'Project Created!'
	  else
	    show_errors(@project)
	    render :new
	  end
	end

end
