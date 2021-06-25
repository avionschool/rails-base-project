class ApplicationController < ActionController::Base
  devise_group :user, contains: %i[admin broker buyer]

  before_action :configure_permitted_parameters, if: :devise_controller?

  def require_admin
    return unless admin_signed_in?

    flash[:error] = 'You are not an admin'
    redirect_to root_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation, :remember_me) }
    devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:username, :password, :remember_me) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:username, :email, :password, :password_confirmation, :current_password) }
  end
end
