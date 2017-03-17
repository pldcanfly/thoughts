module SessionsHelper
  def is_logged_in?
    return NOT session[:current_user].nil?
  end
end
