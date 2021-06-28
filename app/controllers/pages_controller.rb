class PagesController < ApplicationController
  before_action :authenticate_user!

  def home
    @name = current_user.first_name
  end
end
