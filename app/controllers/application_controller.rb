class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  include Pundit
  after_action :verify_authorized, except: [:index], unless: :skip_pundit?
  after_action :verify_policy_scoped, only: [:index], unless: :skip_pundit?
  before_action :configure_permitted_parameters, if: :devise_controller?
  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: user_params)
    devise_parameter_sanitizer.permit(:sign_in, keys: user_params)
    devise_parameter_sanitizer.permit(:account_update, keys: user_params)
  end

  def user_params
    %i[ email username picture admin state_id biography ].freeze
  end

end
