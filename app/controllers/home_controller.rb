class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    # if params[:approved] == "false"
    @brokers = Broker.unapproved_users
    # else
    #   @users = User.all
    # end
  end

  def approve_user(user)
    user.approved = true
  end
  helper_method :approve_user
end
