class RegistrationsController < Devise::RegistrationsController
  protected

  def after_update_path_for(resource)
    case resource
    when Admin then admins_path
    when Supplier then supplier_path(@supplier)
    when Buyer then buyer_path(@buyer)
    end
  end
end
