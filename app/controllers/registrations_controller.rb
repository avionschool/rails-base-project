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
      end
    end
    protected

    def after_sign_in_path_for(resource)
      if resource.account_type == "buyer"
        buyer_index_path	  
      elsif resource.account_type == "broker"
        broker_index_path	
      end
    end
  end