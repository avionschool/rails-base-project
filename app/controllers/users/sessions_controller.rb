module Users
  class SessionsController < Devise::SessionsController
    def create
      self.resource = warden.authenticate!(auth_options)
      if current_user.approved?
        set_flash_message(:notice, :signed_in) if is_navigational_format?
        sign_in(resource_name, resource)
        if session[:return_to].present?
          redirect_to session[:return_to]
          session[:return_to] = nil
        else
          respond_with resource, 'location' => after_sign_in_path_for(resource)
        end
      else
        sign_out current_user
        redirect_to '/'
      end
    end
  end
end
