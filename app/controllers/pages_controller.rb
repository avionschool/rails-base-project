class PagesController < ApplicationController
  before_action :authenticate_user!

  def home
    @user_type = current_user.user_type.user_type
    @name = current_user.first_name
  end
end
