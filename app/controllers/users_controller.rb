class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @fullname = current_user.fullname
  end
end
