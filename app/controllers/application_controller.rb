class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :create_body_identifiers
  
  def show_errors(target)
    if target.errors.any?
      flash.now[:error] ||= []
      target.errors.full_messages.each do |msg|
        flash.now[:error] << msg
      end
    else
      flash.now[:error] = 'An error has occured!'
    end
  end
  
  def create_body_identifiers
    @body_class = params[:controller]
    @body_id = params[:action]
  end
  
  def not_authenticated
    flash[:error] = 'You must login to access this page.'
    redirect_to login_path
  end
  
end
