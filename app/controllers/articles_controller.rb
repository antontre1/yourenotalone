class ArticlesController < ApplicationController

  def index
    if params[:theme_id]
      @articles = policy_scope(Article).where(theme_id: params[:theme_id])
      @theme = Theme.find(params[:theme_id])
      authorize @theme
    else
      @articles = policy_scope(Article)
    end

<<<<<<< HEAD
   def new
=======
  end

  def show
    @article = Article.find(params[:id])
    authorize @article
  end

  def new
>>>>>>> 853c37894ce54ee4b0476444edadc35cc0f258e0
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
