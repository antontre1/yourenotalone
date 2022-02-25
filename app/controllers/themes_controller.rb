class ThemesController < ApplicationController
  def index
    @themes = policy_scope(Theme)
    @favorites = current_user.favorites.where(favoritable_type: "Theme")
    @placeholder_value= "thème en lien avec ..."
  end

  def show
    @scope_last = "récents sur ce thème"
    @theme = Theme.find(params[:id])
    authorize @theme
    @article = Article.new
    @articles = policy_scope(Article).all.order(updated_at: :desc)
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
