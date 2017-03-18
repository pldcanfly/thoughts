class StaticPagesController < ApplicationController
  def index
    if is_logged_in?
      redirect_to thinker_path session[:current_user]
    end
  end

  def impressum
  end
end
