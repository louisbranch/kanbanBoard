class UserPasswordController < ApplicationController
  before_filter :require_login

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      redirect_to account_path, :notice => 'Password was successfully updated.'
    else
      render :edit
    end
  end

end
