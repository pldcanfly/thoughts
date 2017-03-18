module SessionsHelper
  def is_logged_in?
    if defined? session[:current_user] and not session[:current_user].nil?
      return true
    end
    return false
  end
end
