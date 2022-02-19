class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @disable_nav = true;
  end

  def dashboard
    @themes = current_user.favorites.where(favoritable_type: "Theme").limit(10)
    @thems_nb = current_user.favorites.where(favoritable_type: "Theme").count
    @articles = current_user.favorites.where(favoritable_type: "Article").limit(3)
    @articles_nb = current_user.favorites.where(favoritable_type: "Article").count
    @follow_users = current_user.favorites.where(favoritable_type: "User").limit(10)
    @follow_users_nb = current_user.favorites.where(favoritable_type: "User").count
    @follower_users_nb = Favorite.where(favoritable_type: "User", favoritable_id: current_user.id).count
    @likes = Vote.where(user_id: current_user.id).count
  end

  def wall
    @scope = "Tendances"

    # liste des thèmes trendy
    @array_ranked_themes = Favorite.where(favoritable_type: "Theme").group("favoritable_id").count.sort_by{|_,v| -v}

    @themes = Array.new
    @array_ranked_themes.each do |item|
      @themes << Theme.find(item[0])
    end

    # liste des articles trendy
    @array_ranked_articles = Favorite.where(favoritable_type: "Article").group("favoritable_id").count.sort_by{|_,v| -v}

    @articles = Array.new
    @array_ranked_articles.each do |item|
      @articles << Article.find(item[0])
    end

    # liste des users trendy
    @array_ranked_users = Favorite.where(favoritable_type: "User").group("favoritable_id").count.sort_by{|_,v| -v}

    @users = Array.new
    @array_ranked_users.each do |item|
      @users << User.find(item[0])
    end

  end

  def search
    @scope = "d'intérêt"
    if params[:query].present?
      @themes = Theme.search(params[:query])
      @articles = Article.search(params[:query])
      @users = User.search(params[:query])
      render :wall
    else
      redirect_to action: "wall"
    end
  end

  def bookmarks
    @array_ranked_themes = current_user.favorites.where(favoritable_type: "Theme")
    @themes = Array.new
    @array_ranked_themes.each do |item|
      @themes << item.favoritable
    end

    @array_ranked_articles = current_user.favorites.where(favoritable_type: "Article")
    @articles = Array.new
    @array_ranked_articles.each do |item|
      @articles << item.favoritable
    end

    @array_ranked_users = current_user.favorites.where(favoritable_type: "User")
    @users = Array.new
    @array_ranked_users.each do |item|
      @users << item.favoritable
    end
  end

  def search_bookmarks
    @scope = "favoris"
    if params[:query].present?

      @themes = Theme.search params[:query], where: {} , fields: [:title, :description]
      @articles = Article.search(params[:query])
      @users = User.search(params[:query])
      render :wall
    else
      redirect_to action: "bookmarks"
    end
  end
end
