class FavoritesController < ApplicationController
  after_action :verify_policy_scoped, only: [ :index, :index_th ], unless: :skip_pundit?
  after_action :verify_authorized, except: [ :index, :index_th ], unless: :skip_pundit?

  def index
    @favorites = policy_scope(Favorite)
    @favorites_group = @favorites.select(:favoritable_type).group(:favoritable_type).count
  end

  def index_th
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

  def destroy
    @favorite = Favorite.find(params[:id])
    authorize @favorite
    @favorite.destroy
    redirect_to favorites_th_path
  end



private

  def hug_params
    params.require(:favorite).permit(:user_id, :favoritable)
  end


end
