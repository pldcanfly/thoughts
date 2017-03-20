class ThinkersController < ApplicationController
  include ThinkersHelper
  include ThoughtsHelper
  include FollowersHelper

  def index
    @thinkers = get_some_friends_for(current_user_id?)
  end

  def show
    @thinker = get_thinker_by_name params[:id]

    @follow = follows?(@thinker.id)

    if @thinker.nil?
      redirect_to root_path;
    end

    @thoughts = get_thoughts_for_thinker @thinker


  end

  def new
    @thinker = Thinker.new
  end

  def edit
    if session[:current_user] == params[:id]
      @thinker = get_thinker_by_name params[:id]
    else
      redirect_to root_path
    end
  end

  def create
    @thinker = Thinker.new(params.require(:thinker).permit(:name, :email, :password, :password_confirmations))
      # TODO: NEEDS TO HAVE THE SAME PASSWORD!!
    if @thinker.save
      render thinker_path(@thinker.name)
    else
      render 'new'
    end
  end

  def update
    @thinker = Thinker.find_by name: params[:id]
    if session[:current_user] == @thinker.name
      if @thinker.update params.require(:thinker).permit(:email, :age, :city, :profession)
        redirect_to thinker_path
      else
        render 'edit'
      end
    else
      redirect_to login_path
    end
  end

  private
  def valid_params

  end
end
