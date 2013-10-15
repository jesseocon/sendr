module SessionsHelper
  def log_in(user)
    cookies.permanent[:remember_token] = user.auth_token
  end
  
  def logged_in?(user)
    !user.nil?
  end
  
  def log_out(user)
    user = nil
    cookies.delete(:remember_token)
  end
end
