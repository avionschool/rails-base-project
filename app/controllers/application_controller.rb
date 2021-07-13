class ApplicationController < ActionController::Base
  before_action :devise_parameter_sanitizer, if: :devise_controller?

  protected

  def devise_parameter_sanitizer
    if resource_class == User
      User::ParameterSanitizer.new(User, :user, params)
    elsif resource_class == Nutritionist
      Nutritionist::ParameterSanitizer.new(Nutritionist, :nutritionist, params)
    elsif resource_class == Admin
      Admin::ParameterSanitizer.new(Admin, :admin, params)
    end
  end
end
