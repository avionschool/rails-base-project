class BrokerController < ApplicationController
  before_action :authenticate_broker!

  def index; end

  def portfolio
    @added_stocks = current_broker.stocks
  end

  def transactions
    @transactions = Transaction.where(broker_id: current_broker.id)
  end
end
