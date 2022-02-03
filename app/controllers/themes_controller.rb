class ThemesController < ApplicationController
  def index
    @themes = policy_scope(Theme)
    @favorites = current_user.favorites.where(favoritable_type: "Theme")
  end

  def show
    @theme = Theme.find(params[:id])
    authorize @theme
  end
end
