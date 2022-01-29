class ThemesController < ApplicationController
  def index
    @themes = policy_scope(theme)
  end
end
