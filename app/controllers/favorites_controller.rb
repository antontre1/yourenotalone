class FavoritesController < ApplicationController
  after_action :verify_policy_scoped, only: [ :index, :index_th, :index_art, :index_user ], unless: :skip_pundit?
  after_action :verify_authorized, except: [ :index, :index_th, :index_art, :index_user ], unless: :skip_pundit?

  def index
    @favorites = policy_scope(Favorite)
    @favorites_group = @favorites.select(:favoritable_type).group(:favoritable_type).count
  end

  def index_th
    # @favorites = FavoritePolicy::Scope.new(current_user, Favorite).resolve
    @favorites = policy_scope(Favorite)
    # @favorites = Favorite.all
  end

  def index_art
    # @favorites = FavoritePolicy::Scope.new(current_user, Favorite).resolve

    @scope = "favoris"
    # @favorites = policy_scope(Favorite)  current_user.favorites
    @array_ranked_articles = policy_scope(Favorite).where(user_id: current_user.id, favoritable_type: "Article")
    @articles = Array.new
    @array_ranked_articles.each do |item|
      @articles << item.favoritable
    end
    # @favorites = Favorite.all
  end

  def index_user
    # @favorites = FavoritePolicy::Scope.new(current_user, Favorite).resolve
    @favorites = policy_scope(Favorite)
    # @favorites = Favorite.all
  end

  def new
    @favorite = Favorite.new
  end

  def create
    @favorite = Favorite.new(favorite_params)
    redirect_to themes_path
  end


  def create_fav_th
    @favorite = Favorite.new
    if current_user.favorites.where(favoritable_type: "Theme").where(favoritable_id: params[:id]).count == 0
      @theme = Theme.find(params[:id])
      authorize @favorite
      @favorite.user = current_user
      @favorite.favoritable = @theme
      @favorite.save
    end
    authorize @favorite
    redirect_to favorites_th_path
  end


  def create_fav_art
    @article = Article.find(params[:id])
    @favorite = current_user.favorites.where(favoritable_type: "Article").find_by(favoritable_id: params[:id])
    if @favorite
      authorize @favorite
      @favorite.destroy
    else
      @article = Article.find(params[:id])
      @favorite = Favorite.new
      authorize @favorite
      @favorite.user = current_user
      @favorite.favoritable = @article
      @favorite.save
    end
    redirect_to article_path(@article)
  end

  def create_fav_user
    @article = Article.find(params[:id])
    @user = @article.user
    @favorite = current_user.favorites.where(favoritable_type: "User").find_by(favoritable_id: @user.id)
      if @favorite
        authorize @favorite
        @favorite.destroy
      else
        @favorite = Favorite.new
        authorize @favorite
        @favorite.user = current_user
        @favorite.favoritable = @user
        @favorite.save
      end
    redirect_to article_path(@article)
  end


  def destroy
    @favorite = Favorite.find(params[:id])
    authorize @favorite
    @favorite.destroy
    redirect_to favorites_th_path
  end



private

  def favorite_params
    params.require(:favorite).permit(:user_id, :favoritable)
  end


end
