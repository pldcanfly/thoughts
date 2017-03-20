class LovesController < ApplicationController
  include LovesHelper
  include ThinkersHelper
  include ThoughtsHelper
  respond_to :html, :js

  def create
    if is_logged_in?
      @love = Like.new follow_params
      @thought = get_thought(params[:thought][:thought_id])
      @love.save
    end
  end

  def destroy
    if is_logged_in?
      @love = Like.find_by follow_params
      @thought = get_thought(params[:thought][:thought_id])
      @love.destroy
    end
  end

  private
  def follow_params
    { thought: params[:thought][:thought_id], thinker: current_user_id? }
  end
end
