class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  devise_group :user, contains: %i[buyer broker]

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:type])
  end
end
