class ArticlesController < ApplicationController

  def index
    @articles = policy_scope(Article)
  end

  def show
    @article = Article.find(params[:id])
    authorize @article
  end

  def new
    @article = Article.new
    authorize @article
  end

  def create
    @article = Article.new(article_params)
    @article.user_id =  current_user.id
    if @article.save
      redirect_to article_path(@article)
    else
      render :new
    end
    authorize @article
  end

  private

  def article_params
    params.require(:article).permit(:title, :description, :theme, :content)
  end

end
