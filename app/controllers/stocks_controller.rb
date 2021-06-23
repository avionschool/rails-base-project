class StocksController < ApplicationController
  def index
    @iex_client = IEX::Api::Client.new(
      publishable_token: 'Tpk_1b73e94d5c7a45839071c3c6fa651dbe', 
      secret_token: 'Tsk_3f7e77a8a28142a3b816b9ea86c1efea', 
      endpoint: 'https://sandbox.iexapis.com/v1'
      # endpoint: 'https://cloud.iexapis.com/v1' # use 'https://sandbox.iexapis.com/v1' for Sandbox
    ).stock_market_list(:mostactive)
  end
end
