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
    # liste des thèmes trendy
    @scope = "Tendances"
    @list_themes = Favorite.where(favoritable_type: "Theme").group("favoritable_id").count.sort_by{|_,v| -v}

    @themes = Array.new
    @list_themes.each do |item|
      @themes << Theme.find(item[0])
    end


    @articles = current_user.favorites.where(favoritable_type: "Article").limit(3)

    # liste des users trendy
    @table_ranked_users = Favorite.where(favoritable_type: "User").group("favoritable_id").count.sort_by{|_,v| -v}

    @users = Array.new
    @table_ranked_users.each do |item|
     @users << User.find(item[0])
    end

  end

  def search
    @scope = "d'intérêt"
    if params[:query].present?
      @themes = Theme.where(title: params[:query])
      @articles = Article.where(title: params[:query])
      @users = User.where(username: params[:query])
      render :wall
    else
      redirect_to action: "wall"
    end
  end

end
