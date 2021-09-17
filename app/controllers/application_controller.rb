class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  # adding flashtypes based on bootstrap
  add_flash_types :danger, :info, :warning, :success, :light, :dark, :primary

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[username full_name])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[username full_name])
  end
end
