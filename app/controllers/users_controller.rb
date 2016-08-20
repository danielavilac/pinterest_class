class UsersController < ApplicationController
  include ApplicationHelper
  layout 'login'

  def new
    @user = User.new
  end

  def edit
    @user = current_user
  end

  def create
    @user = User.new(permitted_params)
    if @user.save
      flash[:notice] = "User created"
      redirect_to root_path
    else
      flash[:error] = "Error, try again"
      redirect_to register_path
    end
  end

  def update
    @user = current_user
    if @user.update(permitted_params)
      redirect_to root_path 
    else
      respond_with @user
    end
  end

  def permitted_params
    params.require(:user)
      .permit(:username, :first_name, :lastname, :email, :password)
  end
end
