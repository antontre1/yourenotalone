class ThemesController < ApplicationController
  def index
    @themes = policy_scope(Theme)
  end

  def show
    @theme = Theme.find(params[:id])
    authorize @theme
  end
end
