class ApplicationController < ActionController::Base
  before_action :devise_parameter_sanitizer, if: :devise_controller?

  def authenticate!
    if user_signed_in?
      @cur_user = current_user
      :authenticate_user!
    elsif nutritionist_signed_in?
      @cur_user = current_nutritionist
      :authenticate_nutritionist!
    elsif admin_signed_in?
      @cur_user = current_admin
      :authenticate_admin!
    else
      :authenticate_user!
    end
  end

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
