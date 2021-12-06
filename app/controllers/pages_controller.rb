class PagesController < ApplicationController
  def home
    @users = User.all
  end

end