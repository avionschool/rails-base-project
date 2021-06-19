class HomeController < ApplicationController
  def index; end

  def portfolio; end

  def transaction
    @transactions = current_buyer.purchase_transactions if current_buyer
    @transactions = PurchaseTransaction.where(broker_id: current_broker.id) if current_broker
  end
end
