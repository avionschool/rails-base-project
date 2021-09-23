class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  # adding flashtypes based on bootstrap
  add_flash_types :danger, :info, :warning, :success, :light, :dark, :primary

  def after_sign_in_path_for(resource)
    if resource.instance_of?(Admin)
      admins_trader_settings_path
    elsif resource.instance_of?(User)
      root_path
    end
  end

  def after_sign_out_path_for(resource)
    case resource
    when :admin
      new_admin_session_path
    when :user
      root_path
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[username full_name])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[username full_name])
  end
end
