class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  # adding flashtypes based on bootstrap
  add_flash_types :danger, :info, :warning, :success, :light, :dark, :primary

  def after_sign_in_path_for(resource)
    admins_trader_settings_path if resource.instance_of?(Admin)
  end

  def after_sign_out_path_for(resource)
    new_admin_session_path if resource == :admin
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[username full_name])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[username full_name])
  end
end
