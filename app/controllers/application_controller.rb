class ApplicationController < ActionController::Base
  # before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(_resource)
    root_path
  end

  def after_sign_in_path_for(resource)
    if resource.instance_of?(Admin)
      admins_user_portfolio_path
    elsif resource.instance_of?(User)
      my_portfolio_path(current_user)
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[username first_name last_name])
  end
end
