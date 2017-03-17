class SessionsController < ApplicationController

  def new
    # Show-Login-Page
  end

  def create
    # LOGIN
    @thinker = Thinker.find_by(name: params[:session].require(:name)).try(:authenticate, params[:session].require(:password))
    if @thinker
      session[:current_user] = @thinker.id
      @current_user = @thinker.id
      puts '################ LOGGED '
      redirect_to(thinker_path(@thinker.name))
    else
      puts '########### Not logged '
    end
  end


  # @current_user =  session[:current_user]


  def destroy
    reset_session
    redirect_to root_path
  end
end
