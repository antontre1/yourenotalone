class VotesController < ApplicationController

  def new
    @article = Article.find(params[:article_id])
    @vote = Vote.new
    authorize @vote
  end


  def create
    @article = Article.find(params[:article_id])
    @vote = current_user.votes.where(reaction: params[:reaction].to_i, article: @article).first
    if @vote
      @vote.destroy
    else
      @vote = Vote.new
      @vote.reaction = params[:reaction].to_i
      @vote.article = @article
      @vote.user_id = current_user.id
      if @vote.save
        redirect_to article_path(@article)
      else
        render :new
      end
    end
    authorize @vote
  end

  def destroy
    @vote = Vote.find(params[:id])
    authorize @vote
    @article = Article.find(params[:article_id])
    @vote.destroy
    redirect_to article_path(@article)
  end

  private

  def vote_params
    params.require(:vote).permit(:article_id)
  end

end
