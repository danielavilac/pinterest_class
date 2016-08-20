class SessionsController < ApplicationController
  include ApplicationHelper
  before_action :login_validation
  layout 'login'
  
  def new; end

  def create
    user = User.where(username: params[:username])
    if user.present? and user.first.password == params[:password]
      session[:user_id] = user.first.id
      flash[:notice] = "Welcome #{user.first.full_name}"
      redirect_to root_path
    else
      flash[:error] = "Incorrect username and/or password"
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end

  def login_validation
    if user_loged_in?
      redirect_to root_path
    end
  end
end
