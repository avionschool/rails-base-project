class UsersController < ApplicationController
  def index
    @roles = Role.all
  end

  def new
    @user = User.new
  end
end
