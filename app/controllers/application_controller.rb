class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    if resource.instance_of?(Admin)
      admins_view_traders_path
    elsif resource.instance_of?(User)
      user_portfolio_path
    end
  end

  def after_sign_out_path_for(resource)
    case resource
    when :admin
      new_admin_session_path
    when :user
      new_user_session_path
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:fullname, :email, :password) }

    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:fullname, :email, :password, :current_password) }
  end
end
