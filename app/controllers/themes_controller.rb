class ThemesController < ApplicationController
  def index
    @themes = policy_scope(Theme)
    @favorites = current_user.favorites.where(favoritable_type: "Theme")
  end

  def show
    @theme = Theme.find(params[:id])
    authorize @theme
  end

  def new
    @theme = Theme.new
    authorize @theme
  end

  def create
    @theme = Theme.new(theme_params)
    authorize @theme
    @theme.save
    redirect_to theme_path(@theme.id)
  end

  private

  def theme_params
    params.require(:theme).permit(:title, :description, :picture )
  end

end
