class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    # admin_dashboard_path if resource.instance_of?(Admin)
    if resource.instance_of?(Admin)
      admin_dashboard_path
    elsif resource.instance_of?(Trader)
      trader_portfolio_path
    end
  end

  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username, :fullname, :email, :password, :password_confirmation) }

    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:username, :fullname, :email, :password, :current_password) }
  end
end
