class PagesController < ApplicationController
  def landing
    unless user_signed_in?
      render :action => 'not_logged_in'
    end
  end
end
