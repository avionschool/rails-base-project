class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def redirect_if_not_loggedin
    redirect_to(new_user_session_path, { alert: 'Please sign in first' }) unless user_signed_in?
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:username, :firstname, :lastname, :email, :password, :password_confirmation, :role)
    end
  end
end
