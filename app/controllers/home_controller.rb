class HomeController < ApplicationController

	def	show
	  if logged_in?
	    redirect_to projects_path
	  end
	end
	
end
