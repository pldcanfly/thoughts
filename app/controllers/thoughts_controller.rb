class ThoughtsController < ApplicationController
  include ThinkersHelper

  def index
    @thinker = get_thinker_by_name(params[:thinker_id])
    @thoughts = Thought.where(author: @thinker.id).all # TODO: Batch processing
  end

  def create
    if is_logged_in?
      @thought = Thought.new params.require(:thought).permit(:text)
      @thought.author = get_thinker_by_name(params[:thinker_id]).id
      @thought.likes = 0

      if @thought.save
        redirect_to thinker_path(session[:current_user])
      else
        render 'new'
      end
    else
      redirect_to root_path
     end
  end

  def update
    if is_logged_in?
      @thought = Thought.find(params[:id])
      @thought.text = params[:thought][:text]
      if @thought.save
        redirect_to thinker_thought_path(@thought.id)
      else
        render 'edit'
      end
    else
      redirect_to root_path
    end
  end

  def new
    @thought = Thought.new
  end

  def edit
    @thought = Thought.find params[:id]
  end

  def show
    @thought = Thought.find params[:id]
  end

end
