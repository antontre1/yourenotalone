class ArticlesController < ApplicationController

  def index
    if params[:theme_id]
      @articles = policy_scope(Article).where(theme_id: params[:theme_id])
      @theme = Theme.find(params[:theme_id])
      authorize @theme
    else
      @articles = policy_scope(Article)
    end

  end

  def show
    @article = Article.find(params[:id])
    authorize @article
  end

end
