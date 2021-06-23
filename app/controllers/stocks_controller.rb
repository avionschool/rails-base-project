class StocksController < ApplicationController
  def index
    @iex_client = IEX::Api::Client.new(
      publishable_token: ENV['IEX_PUBLISHABLE_TOKEN'],
      secret_token: ENV['IEX_SECRET_TOKEN'],
      endpoint: 'https://sandbox.iexapis.com/v1'
      # endpoint: 'https://cloud.iexapis.com/v1' 
      # use 'https://sandbox.iexapis.com/v1' for Sandbox
    ).stock_market_list(:mostactive)
  end
end
