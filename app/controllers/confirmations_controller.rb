class ConfirmationsController < Devise::ConfirmationsController
    private
    def after_confirmation_path_for(resource_name, resource)
        # sign_in(resource) # In case you want to sign in the user
        redirect_to root_path, notice: 'Successfully confirmed email' #TBD
    end
end