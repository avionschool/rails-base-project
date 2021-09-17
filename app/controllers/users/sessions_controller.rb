class Users::SessionsController < Devise::SessionsController

  # override the redirection
  def create
    self.resource = warden.authenticate!(auth_options)
    set_flash_message!(:notice, :signed_in)
    sign_in(resource_name, resource)
    yield resource if block_given?
    if current_user.status == 0 && current_user.role == 1
      # UserMailer.welcome_email(current_user).deliver_later
      redirect_to new_user_session_path, notice: "We send you an email once the admin approved your account. Thankyou for your patience."
      sign_out resource
    else
      if current_user.role == 1
        # UserMailer.welcome_email(current_user).deliver_later
        respond_with resource, location: home_path
      else
        respond_with resource, location: admin_dashboard_path
      end
    end
  end

end