module ThinkersHelper
  def user_logged?
    return NOT session[:current_user].nil?
  end

  def get_thinker_by_name(name)
    if Thinker.exists? name: name
      @thinker = Thinker.find_by name: name
    else
      return false
    end
  end

  def get_thinker_by_id(id)
    if Thinker.exists? id
      @thinker = Thinker.find id
    else
      return false
    end
  end
end
