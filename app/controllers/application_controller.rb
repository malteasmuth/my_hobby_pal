class ApplicationController < ActionController::Base
  # white list approach: protect every route by default
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end
end
