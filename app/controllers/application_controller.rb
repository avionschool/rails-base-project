class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  devise_group :user, contains: %i[tourist agency admin]

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[type username first_name last_name address birth_date agency_name approved])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[first_name last_name profile_pic cover_pic address birth_date agency_name approved])
  end
end
