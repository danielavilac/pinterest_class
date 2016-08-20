module ApplicationHelper
  def current_user
    return User.find(session[:user_id])
  end

  def user_loged_in?
    return !session[:user_id].nil?
  end
end
