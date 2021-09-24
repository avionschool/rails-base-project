class Users::RegistrationsController < Devise::RegistrationsController
  def create
    build_resource(sign_up_params)
    resource.role = 1
    resource.save
    # yield resource if block_given?
    if resource.persisted?
      if resource.active_for_authentication?
        set_flash_message! :notice, :signed_up
        UserMailer.welcome_email(resource).deliver_later
        sign_out(resource)
        respond_with resource, location: new_user_session_path
      else
        set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end
  end

  def update
    self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)
    prev_unconfirmed_email = resource.unconfirmed_email if resource.respond_to?(:unconfirmed_email)

    resource_updated = update_resource(resource, account_update_params)

    if resource_updated
      flash[:notice] = 'Successfully updated your account!'
      bypass_sign_in resource, scope: resource_name if sign_in_after_change_password?
      respond_with resource, location: trader_stock_path
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end
  end

  protected

  def account_update_params
    # devise_parameter_sanitizer.sanitize(:account_update, keys: [:first_name, :last_name])
    params.require(:user).permit(:username, :firstname, :lastname, :email, :password, :password_confirmation, :current_password)
  end
end
