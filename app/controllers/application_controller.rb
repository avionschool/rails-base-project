class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    admins_view_traders_path if resource.instance_of?(Admin)
  end

  def after_sign_out_path_for(resource)
    case resource
    when :admin
      new_admin_session_path
    end
  end
end
