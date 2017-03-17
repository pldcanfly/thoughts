class ThoughtsController < ApplicationController
  def index
    @thoughts = Thought.where(author: get_author_id(params[:thinker_id])).all # TODO: Batch processing
    # TODO: SET AUTHOR NAME
    # @thoughts = Thought.all
  end

  def create
    if session[:current_user]
      @thought = Thought.new params.require(:thought).permit(:text)
      @thought.author = get_author_id(params[:thinker_id])
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

  private

  def get_author_id(name)
    @author = Thinker.find_by(name: name)
    return @author.id
  end

  def get_author_name(id)
    @author = Thinker.find(id)
    return @author.name
  end

end
