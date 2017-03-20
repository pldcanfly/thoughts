module SessionsHelper
  include ThinkersHelper

  def is_logged_in?
    if defined? session[:current_user] and not session[:current_user].nil?
      return true
    end
    return false
  end

  def current_user_id?
    if thinker = current_user?
      return thinker.id
    end

    return false
  end


  def current_user?
    if defined? session[:current_user] and not session[:current_user].nil?
      return get_thinker_by_name(session[:current_user])
    end

    return false
  end
end
