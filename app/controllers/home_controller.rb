class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @brokers = Broker.where(approved: false)
  end

  def approve
    user = Broker.find(params[:id])
    user.approved = true
    user.save
    BrokerMailer.new_broker_account_approved(user).deliver
    redirect_to root_path
  end
end
