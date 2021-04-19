class SessionsController < Devise::SessionsController
    
    protected

    def after_sign_in_path_for(resource)
      if resource.account_type == "buyer"
        buyer_index_path	  
      elsif resource.account_type == "broker"
        broker_index_path	
      elsif resource.account_type == "admin"
        admin_index_path	
      end
    end
  end
  