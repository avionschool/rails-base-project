class HomeController < ApplicationController
  def index
    client = IEX::Api::Client.new(
      publishable_token: 'Tpk_120e7d5173ef4d039e69274c8a21bde4',
      secret_token: 'Tsk_adbfa3c9eedc4ce8aae006027027ea78',
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
