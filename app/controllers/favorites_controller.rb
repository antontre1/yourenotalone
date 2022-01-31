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
end
