class ThinkersController < ApplicationController
  def show
    @thinkers = Thinker.all
  end

  def new
    @thinker = Thinker.new
  end

  def edit

  end

  def create
    @thinker = Thinker.new(
                          name: params[:name],
                          email: params[:email],
                          password: params[:password],
                          password_confirmation: params[:password_confirmation]
    )

    if @thinker.save
      redirect_to thinkers_path
    else
      render 'new'
    end
  end
end
