class UsersController < ApplicationController
  before_filter :require_login, :only => [:show, :edit, :update]

  def show
    @user = current_user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      auto_login(@user)
      remember_me!
      redirect_to projects_path, :notice => "Signed up!"
    else
      render :new
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      redirect_to projects_path, :notice => 'Your account was updated!'
    else
      render :Edit
    end
  end

  def destroy
    @user = current_user
    if @user.destroy
      redirect_to root_path, :notice => 'Your account was deleted!'
    end
  end

end
