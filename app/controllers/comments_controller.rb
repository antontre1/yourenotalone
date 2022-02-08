class CommentsController < ApplicationController

  def index
    if params[:theme_id]
      @articles = policy_scope(Article).where(theme_id: params[:theme_id])
      @theme = Theme.find(params[:theme_id])
      authorize @theme
    else
      @articles = policy_scope(Article)
    end
  end

  def new
    @article = Article.find(params[:article_id])
    @comment = Comment.new
    authorize @comment
  end

  def create
    @comment = Comment.new(comment_params)
    @article = Article.find(params[:article_id])
    @comment.article = @article
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to article_path(@article)
    else
      render :new
    end
    authorize @comment
  end

  def destroy
    @comment = Comment.find(params[:id])
    authorize @comment
    @article = Article.find(params[:article_id])
    @comment.destroy
    redirect_to article_path(@article)
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :article_id)
  end

end
