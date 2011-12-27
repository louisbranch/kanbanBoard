class HomeController < ApplicationController

	def	show
	  if logged_in?
	    if flash[:error]
	      flash[:error] = flash[:error]
	    end
	    redirect_to projects_path
	  end
	end
	
end
