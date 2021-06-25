class HomeController < ApplicationController
  def index
    @users = User.where.not(type: 'Admin')
  end
end
