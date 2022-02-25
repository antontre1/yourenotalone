class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @disable_nav = true;
  end

  def dashboard
    @me_active = "activated-logo"
    @article = Article.new
    @scope = "que je suis"
    @currentpath = search_bookmarks_path
    @likes = Vote.where(user_id: current_user.id).count

    @user_profile = current_user

    # liste des articles écrits par moi
    @articles_last = current_user.articles.order(created_at: :desc)
    @scope_last = "récents"

    # liste des users que je suis
    array_ranked_users = current_user.favorites.where(favoritable_type: "User").group("favoritable_id").count.sort_by{|_,v| -v}

    @users = Array.new
    array_ranked_users.each do |item|
      @users << User.find(item[0])
    end

    @follow_users_nb = current_user.favorites.where(favoritable_type: "User").count
    @follower_users_nb = Favorite.where(favoritable_type: "User", favoritable_id: current_user.id).count

    # liste de mes themes

    array_ranked_themes = current_user.favorites.where(favoritable_type: "Theme")
    @themes = Array.new
    array_ranked_themes.each do |item|
      @themes << item.favoritable
    end

    @themes_list = Array.new
    themes_all = Theme.all
    themes_all.each do |item|
      @themes_list << item.title
    end


    @thems_nb = current_user.favorites.where(favoritable_type: "Theme").count

    # liste des articles suivis

    array_ranked_articles = current_user.favorites.where(favoritable_type: "Article")
    @articles = Array.new
    array_ranked_articles.each do |item|
      @articles << item.favoritable
    end

    @articles_nb = current_user.favorites.where(favoritable_type: "Article").count


  end

  def wall
    @discover_active = "activated-logo"
    @scope = "Tendances"
    @placeholder_value= "ex: que faire avec le soleil..."
    @currentpath = search_path
    @article = Article.new

    # liste des thèmes trendy
    @array_ranked_themes = Favorite.where(favoritable_type: "Theme").group("favoritable_id").count.sort_by{|_,v| -v}

    @themes = Array.new
    @array_ranked_themes.each do |item|
      @themes << Theme.find(item[0])
    end

    @themes_list = Array.new
    themes_all = Theme.all
    themes_all.each do |item|
      @themes_list << item.title
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
    @placeholder_value= "ex: faire avec le soleil..."
    @currentpath = search_path
    @article = Article.new
    query = params[:query]
    if query.present?
      @themes = Theme.search(query)
      @articles = Article.search(query)
      @users = User.search(query)
      render :wall, locals: { article: @article }
    else
      redirect_to action: "wall"
    end
  end

  def bookmarks
    @favorite_active = "activated-logo"
    @scope = "en favoris"
    @placeholder_value= "rechercher dans mes favoris..."
    @currentpath = search_bookmarks_path
    @article = Article.new


    @array_ranked_themes = current_user.favorites.where(favoritable_type: "Theme")
    @themes = Array.new
    @array_ranked_themes.each do |item|
      @themes << item.favoritable
    end

    @themes_list = Array.new
    themes_all = Theme.all
    themes_all.each do |item|
      @themes_list << item.title
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
    @currentpath = search_bookmarks_path
    @article = Article.new

    if params[:query].present?

      # search on favorites themes only, in three steps :
      # 1 - obtain all themes favorites
      # 2 - obtain all themes with searched keyword
      # 3 - cross those two lists to only retain correct favorites themes researched

      array_ranked_themes = current_user.favorites.where(favoritable_type: "Theme")
      themes_fav = Array.new
      selectid = Array.new
      array_ranked_themes.each do |item|
        themes_fav << item.favoritable
      end
      themes_fav.each { |item| selectid << item.id }
      themes_req = Theme.search params[:query], where: {} , fields: [:title, :description]

      @themes = themes_req.select do |theme|
        selectid.include?(theme.id)
      end

      # search on favorites users

      array_ranked_users = current_user.favorites.where(favoritable_type: "User")
      users_fav = Array.new
      selectid_users = Array.new
      array_ranked_users.each do |item|
        users_fav << item.favoritable
      end
      users_fav.each { |item| selectid_users << item.id }
      users_req = User.search params[:query], where: {} , fields: [:username]

      @users = users_req.select do |item|
        selectid_users.include?(item.id)
      end

      # search on favorites articles

      array_ranked_articles = current_user.favorites.where(favoritable_type: "Article")
      articles_fav = Array.new
      selectid = Array.new
      array_ranked_articles.each do |item|
        articles_fav << item.favoritable
      end
      articles_fav.each { |item| selectid << item.id }
      articles_req = Array.new

      articles_req = Article.search params[:query], fields: [:title, :description, :content]

      # en cours de dev : il faut réussir à fusionner les résultats selon les deux recherches:
      #
      # if (Article.search params[:query], fields: [:title, :description, :content])[0]
      #   articles_req = Article.search params[:query], fields: [:title, :description, :content]
      # end

      # (Article.search where: {user_id: selectid_users}).each do |item|
      #   articles_req << item
      # end
      @articles = articles_req.select do |item|
        selectid.include?(item.id)
      end

      render :bookmarks

    else
      redirect_to action: "bookmarks"
    end
  end

  def pub_profile
    @article = Article.new
    @scope = "d'intérêts"
    @scope_last = "récents"
    @user = User.find(params[:id])


    @themes_list = Array.new
    themes_all = Theme.all
    themes_all.each do |item|
      @themes_list << item.title
    end

    if !current_user.favorites.where(favoritable_type: "User", favoritable_id: @user.id).empty?
      @star = "active"
    else
      @star = "inactive"
    end
      @follow_users_nb = @user.favorites.where(favoritable_type: "User").count
      @follower_users_nb = Favorite.where(favoritable_type: "User", favoritable_id: @user.id).count
      @likes = Vote.where(user_id: @user.id).count
    # else
      # redirect_to action: "dashboard"
    # end
      @articles_last = @user.articles.order(created_at: :desc)
      # liste des articles trendy
          @array_ranked_articles = Favorite.where(favoritable_type: "Article").group("favoritable_id").count.sort_by{|_,v| -v}
          @articles_popular = Array.new
          @array_ranked_articles.each do |item|
            if Article.find(item[0]).user == @user
              @articles_popular << Article.find(item[0])
            end
          end
          if @articles_popular.empty?
            @no_favorites = "#{@user.username} n'a pas encore d'article suivi..."
          end
  end

  def toggle_fav
    if current_user.favorites.where(favoritable_type: "User", favoritable_id: params[:id]).empty?
      Favorite.create(user_id: current_user.id , favoritable: User.find(params[:id]) )
    else
      current_user.favorites.where(favoritable_type: "User", favoritable_id: params[:id])[0].destroy
    end
    redirect_to action: :pub_profile
  end

  def home_first
    @home_active = "activated-logo"
    @scope_last = 'récents'
    @scope = 'récents'
    # liste des derniers users, themes, articles
    @users = User.all.order(created_at: :desc).limit(15)
    @themes = Theme.all.order(created_at: :desc).limit(15)
    @articles = Article.all.order(updated_at: :desc).limit(15)
  end

end
