class PagesController < ApplicationController
  def landing
    if !(user_signed_in? || admin_signed_in?)
      render action: 'not_logged_in'

    elsif user_signed_in?
      if current_user.role_id == 1
        redirect_to buyers_path
      else
        redirect_to brokers_path
      end
    end
  end
end
