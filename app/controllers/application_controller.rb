class ApplicationController < ActionController::Base

    before_action :configure_allowed_parameters, if: :devise_controller?

    protected

    def configure_allowed_parameters
        devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:role_id, :username, :first_name, :last_name, :email, :password)}
        devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:username, :first_name, :last_name, :email, :password, :current_password)}
    end
end
