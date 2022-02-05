class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def dashboard
    @themes = current_user.favorites.where(favoritable_type: "Theme").limit(3)
  end

end
