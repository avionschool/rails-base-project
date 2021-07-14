class ConfirmationsController < Devise::ConfirmationsController
  
  private

  def after_confirmation_path_for(resource_name, resource)
    sign_in(resource)
    
    # Redirect to whatever page you want
    root_path
  end
end
