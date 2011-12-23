class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :create_body_identifiers
  
  helper_method :logged_in?
  
  def show_errors(target)
    if target.errors.any?
      flash[:error] ||= []
      target.errors.full_messages.each do |msg|
        flash[:error] << msg
      end
    else
      flash[:error] = 'An error has occured!'
    end
  end
  
  def create_body_identifiers
    @body_class = params[:controller]
    @body_id = params[:action]
  end
  
  def authorize
    unless logged_in?
      flash[:error] = "Not here, Cowboy!"
      redirect_to root_path
      false
    end
  end
  
  def logged_in?
    session[:password]
  end
  
end
