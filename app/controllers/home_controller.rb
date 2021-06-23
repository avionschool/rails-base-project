class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    # if params[:approved] == "false"
    @brokers = Broker.where(approved: false)
    # else
    #   @users = User.all
    # end
  end
end
