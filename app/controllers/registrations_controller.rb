class RegistrationsController < Devise::RegistrationsController
  def create
    build_resource(sign_up_params)
    resource.admin_id = Admin.first.id

    resource.save
    yield resource if block_given?
    if resource.persisted?
      if resource.active_for_authentication?
        set_flash_message! :notice, :signed_up
        sign_up(resource_name, resource)
        respond_with resource, location: after_sign_up_path_for(resource)
      else
        set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      set_minimum_password_length
      flash[:notice] = resource.errors.full_messages.to_sentence
      if resource.account_type == 'buyer'
        redirect_to new_buyer_registration_path
      else
        redirect_to new_broker_registration_path
      end
    end
  end

  def destroy
    Stock.where(added_by: resource.id).destroy_all if resource.account_type == 'broker'
    resource.destroy
    Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name)
    set_flash_message! :notice, :destroyed
    yield resource if block_given?
    respond_with_navigational(resource) { redirect_to after_sign_out_path_for(resource_name) }
  end

  protected

  def after_sign_in_path_for(resource)
    case resource.account_type
    when 'buyer'
      buyer_index_path
    when 'broker'
      broker_index_path
    end
  end
end
