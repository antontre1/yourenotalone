class ThemesController < ApplicationController
  def index
    @themes = policy_scope(Theme)
    @favorites = current_user.favorites.where(favoritable_type: "Theme")
    @placeholder_value= "thème en lien avec ..."
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
    if @theme.save!
      redirect_to theme_path(@theme.id)
    else
      render :new
    end
    authorize @theme
  end

  private

  def theme_params
    params.require(:theme).permit(:title, :description, :picture)
  end

end
