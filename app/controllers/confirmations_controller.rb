class ConfirmationsController < Devise::ConfirmationsController
  private

  def after_confirmation_path_for(resource)
    resource.role = 1
    sign_out(resource)
    new_user_session_path
  end
end
