class FavoritesController < ApplicationController
  def index
    @favorites = policy_scope(Favorite)
    @favorites_group = @favorites.select(:favoritable_type).group(:favoritable_type).count
  end

  def index_th

  end
end
