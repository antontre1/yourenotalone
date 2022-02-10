class ThemesController < ApplicationController
  def index
    @themes = policy_scope(Theme)
    @favorites = current_user.favorites.where(favoritable_type: "Theme")
  end

  def show
    @theme = Theme.find(params[:id])
    authorize @theme
  end

  def new
    @theme = Theme.new
    authorize @theme
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to article_path(@article)
    else
      render :new
    end
    authorize @article
  end


  def create
    @theme = Theme.new(theme_params)
    if @theme.save
      redirect_to theme_path(@theme.id)
    else
      render :new
    end
    authorize @theme
  end

  private

  def theme_params
    params.require(:theme).permit(:title, :description)
  end

end
