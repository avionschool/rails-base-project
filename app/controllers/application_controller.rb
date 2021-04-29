class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception, prepend: true

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[role_id firstname lastname])

    devise_parameter_sanitizer.permit(:account_update, keys: %i[firstname lastname email])
  end
end
