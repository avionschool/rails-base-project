class AdminsController < ApplicationController
  before_action :authenticate_user!

  def approval
    @brokers = Broker.where(approved: false)
  end

  def approve
    user = Broker.find(params[:id])
    user.approved = true
    user.save
    BrokerMailer.new_broker_account_approved(user).deliver
    redirect_to admin_broker_approval_path
  end
end
