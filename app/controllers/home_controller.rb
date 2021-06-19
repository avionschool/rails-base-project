class HomeController < ApplicationController
  def index
    @hope = 'Hope is the anchor of the soul'
    @brokers = User.where(type: 'Broker')
    @buyers = User.where(type: 'Buyer')
  end

  def portfolio; end

  def transaction
    @transactions = current_buyer.purchase_transactions if current_buyer
    @transactions = PurchaseTransaction.where(broker_id: current_broker.id) if current_broker
  end
end
