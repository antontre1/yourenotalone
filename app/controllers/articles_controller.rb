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

  def new
    @article = Article.new
    @themes = Theme.all
    authorize @article
  end

   def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id
    if @article.save
      redirect_to article_path(@article)
    else
      render :new
    end
    authorize @article
  end

  def edit
    @article = Article.find(params[:id])
    authorize @article
  end

 def update
    @article = Article.find(params[:id])
    @article.update(article_params)
    authorize @article
    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
    authorize @article
  end


  private

  def article_params
    params.require(:article).permit(:title, :theme_id, :description, :content)
  end

end
