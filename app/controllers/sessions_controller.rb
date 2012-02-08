class SessionsController < ApplicationController

  def create
    user = login(params[:email], params[:password])
    if user
      remember_me!
      redirect_back_or_to projects_path, :notice => "Logged in!"
    else
      flash.now[:error] = "Email or password was invalid"
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_path, :notice => "You've logged out!"
  end

end
