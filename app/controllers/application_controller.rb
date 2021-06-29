class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  devise_group :user, contains: %i[buyer broker]
  helper_method :current_admin
  helper_method :admin_logged_in?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[type username first_name last_name])
  end

  def current_admin
    Admin.find_by(id: session[:admin_id])
  end

  def admin_logged_in?
    !current_admin.nil?
  end

  def redirect
    redirect_to admins_sign_in_path unless admin_logged_in?
  end
end
