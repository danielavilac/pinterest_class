class PinsController < ApplicationController
  include ApplicationHelper
  
  before_action :session_validation
  def index
    @pins = Pin.all
  end

  def new
    @pin = Pin.new(url: params[:url], user_id: session[:user_id])
  end

  def create
    user = Pin.new(permitted_params)
    if user.save
      flash[:notice] = "Pin created successfully"
      redirect_to root_path
    else
      flash[:error] = "You suck!"
      respond_with @pin
    end
  end

  def permitted_params
    params.require(:pin).permit(:title, :description, :url, :user_id)
  end

  def session_validation
    if !user_loged_in?
      redirect_to login_path
    end
  end
end
