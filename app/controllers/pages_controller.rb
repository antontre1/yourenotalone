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

    @themes = current_user.favorites.where(favoritable_type: "Theme").limit(10)
    @thems_nb = current_user.favorites.where(favoritable_type: "Theme").count
    @articles = current_user.favorites.where(favoritable_type: "Article").limit(3)
    @articles_nb = current_user.favorites.where(favoritable_type: "Article").count
    Favorite.where(favoritable_type: "User").group("favoritable_id").count.sort_by{|_,v| -v}
    @list_users =
    @follower_users_nb = Favorite.where(favoritable_type: "User", favoritable_id: current_user.id).count
    @likes = Vote.where(user_id: current_user.id).count
  end

  def search
    @themes = Theme.where(title: params[:query])
    @articles = Article.where(title: params[:query])
    @list_users = User.where(username: params[:query])
    render :wall
  end

end
