class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :create_body_identifiers
  
  def create_body_identifiers
    @body_class = params[:controller]
    @body_id = params[:action]
  end
  
  def not_authenticated
    flash[:error] = 'You must login to access this page.'
    redirect_to login_path
  end
  
  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = 'You don\'t have access to this project!'
    redirect_to root_path
  end
  
end
