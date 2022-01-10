class BrokerController < ApplicationController
  before_action :authenticate_broker!

  def index
  end

  def portfolio
    @added_stocks = current_broker.stocks
  end

end
