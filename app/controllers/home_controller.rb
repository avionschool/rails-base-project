class HomeController < ApplicationController
  def index
    client = IEX::Api::Client.new(
      publishable_token: Rails.config.publishable_token
      secret_token: Rails.config.secret_token,

      endpoint: 'https://sandbox.iexapis.com/stable'
    )
    @crypto = client.crypto('BTCUSDT')
    @active = client.stock_market_list(:mostactive)
    # @all = client.crypto('SQL')
    # @market = client.market
    # @spy = client.market['SPY'].close.price
    # @fb = client.price('FB')
    # @fb_logo = client.logo('FB')
    # @chart = client.chart('MSFT', 'id', chart_simplify: true)
    # @logo = client.logo('MSFT')
  end
end
