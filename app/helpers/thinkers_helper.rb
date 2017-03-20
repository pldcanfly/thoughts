module ThinkersHelper
  def user_logged?
    return NOT session[:current_user].nil?
  end

  def get_thinker_by_name(name)
    if Thinker.exists? name: name
      return Thinker.find_by name: name
    else
      return false
    end
  end

  def get_some_friends_for(thinker_id, number = 10)
    return Thinker.order("RANDOM()").where.not('id': thinker_id).limit(number)
  end

  def get_thinker_by_id(id)
    if Thinker.exists? id
      return Thinker.find id
    else
      return false
    end
  end

  def get_profile_picture(thinker_id)
    return "david-tennant"
  end
end
