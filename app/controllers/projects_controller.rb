class ProjectsController < ApplicationController
	before_filter :authorize, :except => :index
	
	def index
	  if logged_in?
      @projects = Project.all
	    @statuses = Status.all
    else
      render 'sessions/new'
    end
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
	
	def edit
	  @project = Project.find(params[:id])
	end
	
	def update
	  @project = Project.find(params[:id])
	  if @project.update_attributes(params[:project])
	    redirect_to projects_path, :notice => 'Project Updated!'
	  else
	    show_errors(@project)
	    render :edit
	  end
	end
	
	def destroy
	  @project = Project.find(params[:id])
	  if @project.destroy
	    redirect_to projects_path, :notice => 'Project Deleted!'
	  else
	    show_errors(@project)
	    render :index
	  end
	end

end
