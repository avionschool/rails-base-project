class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :update_allowed_parameters, if: :devise_controller?
  before_action :user_types, if: :devise_controller?
  # before_action :find_user_type, if: :authenticate_user!
  before_action :find_user_type, if: :current_user

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name, :last_name, :email, :password, :password_confirmation, :user_type_id) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password) }
  end

  def user_types
    @broker = UserType.find_by(user_type: 'broker')
    @buyer = UserType.find_by(user_type: 'buyer')
    @admin = UserType.find_by(user_type: 'admin')
  end

  def find_user_type
    @user_type = current_user.user_type.user_type
  end
end
