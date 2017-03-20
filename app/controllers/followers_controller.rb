class FollowersController < ApplicationController
  include ThinkersHelper
  respond_to :html, :js

  def create
    if is_logged_in?
      @follow = Follow.new follow_params
      @thinker = get_thinker_by_id @follow.thinker
      @follow.save
    end
  end

  def destroy
    if is_logged_in?
      @follow = Follow.find_by follow_params
      @thinker = get_thinker_by_id @follow.thinker
      @follow.destroy
    end
  end

  private
  def follow_params
     { thinker: params[:thinker][:thinker_id], follower: current_user_id? }
  end
end
