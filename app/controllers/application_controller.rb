class ApplicationController < ActionController::Base
  def authenticate_admin!
    authenticate_user!
    render status: :forbidden unless current_user.admin?
  end
end
