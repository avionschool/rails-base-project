class HomeController < ApplicationController
  def index
    @client = IEX::Api::Client.new(
        publishable_token: ENV['IEX_API_PUBLISHABLE_TOKEN'],
        secret_token: ENV['IEX_API_SECRET_TOKEN'],
        endpoint: 'https://sandbox.iexapis.com/v1'
    )

    @quote = @client.quote('MSFT')
    
  end
end
