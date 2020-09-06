module SessionsHelper

  def current_user
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: user_id)
    end
  end

  def current_user?(user)
    user && user == current_user
  end

  def logged_in?
    !current_user.nil?
  end

end
