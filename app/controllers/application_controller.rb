class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception, prepend: true

    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:role_id,:firstname,:lastname])
    end
end
