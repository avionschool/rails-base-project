class ApplicationController < ActionController::Base
  # before_action :authenticate_user!

  private

  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(_resource)
    new_user_session_path
  end

  def after_sign_in_path_for(_resource)
    user_homepage_path(current_user)
  end
end
