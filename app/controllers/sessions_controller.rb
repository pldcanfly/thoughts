class SessionsController < ApplicationController

  def new
    # Show-Login-Page
  end

  def create
    # LOGIN
    @thinker = Thinker.find_by(name: params[:session].require(:name)).try(:authenticate, params[:session].require(:password))
    if @thinker
      session[:current_user] = @thinker.name
      @current_user = @thinker.name
      redirect_to thinker_path @thinker.name
    else
      render 'login'
    end
  end

  def destroy
    reset_session
    redirect_to root_path
  end
end
