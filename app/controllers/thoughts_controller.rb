class ThoughtsController < ApplicationController
  include ThinkersHelper

  def index
    @thinker = get_thinker_by_name(params[:thinker_id])
    @thoughts = Thought.where(author: @thinker.id).all # TODO: Batch processing
  end

  def create
    if session[:current_user]
      @thought = Thought.new params.require(:thought).permit(:text)
      @thought.author = get_thinker_by_name(params[:thinker_id]).id
      @thought.likes = 0

      if @thought.save
        render thinker_path(session[:current_user])
      else
        render thinker_path(session[:current_user])
      end
    else
      redirect_to root_path
     end
  end

  def new
    @thought = Thought.new
  end

  def show

  end

end
