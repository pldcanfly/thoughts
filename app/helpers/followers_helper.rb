module FollowersHelper
  include SessionsHelper

  def follows?(thinker_id)
    if is_logged_in?
      return follow_status_for?(thinker_id, current_user_id?)
    end

    return nil
  end

  def follow_status_for?(thinker_id, follower_id)
    follow = Follow.find_by(thinker: thinker_id, follower: follower_id)
  end
end
