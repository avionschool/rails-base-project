class SessionsController < Devise::SessionsController
  protected

  def after_sign_in_path_for(resource)
    case resource.account_type
    when 'buyer'
      buyer_index_path
    when 'broker'
      broker_index_path
    when 'admin'
      admin_index_path
    end
  end
end
