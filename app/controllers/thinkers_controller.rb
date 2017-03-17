class ThinkersController < ApplicationController
  def index
    @thinkers = Thinker.all
  end

  def show
    @thinker = Thinker.find_by(name: params[:id])
    if @thinker.nil?
      redirect_to root_path;
    end
  end

  def new
    @thinker = Thinker.new
  end

  def edit
    @thinker = Thinker.find_by(name: params[:id])
  end

  def create
    @thinker = Thinker.new(params.require(:thinker).permit(:name, :email, :password, :password_confirmations))

    if @thinker.save
      render thinker_path
    else
      render 'new'
    end
  end

  def update
    @article = Thinker.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  private
  def valid_params

  end
end
