module SessionsHelper
  def login!
    session[:user_id] = {
      value: @user.id,
      same_site: :none
    }
  end

  def user_logged_in?
    !session[:user_id].nil?
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authorized_user?
    @user == current_user
  end

  def logout!
    session.clear
  end
end
