class ApplicationController < ActionController::Base
    def after_sign_in_path_for(resource)
        if resource.instance_of?(Admin)
            admins_view_traders_path
        end
    end

    def after_sign_out_path_for(resource)
        case resource
        when :admin
            new_admin_session_path
        end
    end
end