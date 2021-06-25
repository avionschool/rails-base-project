class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @client = IEX::Api::Client.new(
      publishable_token: Rails.application.credentials.iex_publishable_token,
      secret_token: Rails.application.credentials.iex_secret_token,
      endpoint: 'https://sandbox.iexapis.com/v1'
    )

    # @symbols = @client.ref_data_symbols
    @most_active = @client.stock_market_list(:mostactive)
    @gainers = @client.stock_market_list(:gainers)
    @losers = @client.stock_market_list(:losers)

    @users = User.all
  end
end
