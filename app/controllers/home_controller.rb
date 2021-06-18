class HomeController < ApplicationController
  def index; end

  def portfolio; end

  def transaction
    @transactions = current_buyer.transactions if current_buyer
    @transactions = Transaction.where(broker_email: current_broker.email.to_s) if current_broker
  end
end
