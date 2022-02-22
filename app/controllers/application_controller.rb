class ApplicationController < ActionController::Base
    def after_sign_in_path_for(resource)
        if resource.instance_of?(Admin)
            admin_dashboard_path
        end
    end
end
