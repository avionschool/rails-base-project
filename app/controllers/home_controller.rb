class HomeController < ApplicationController
  def index
    @client = IEX::Api::Client.new(
      publishable_token: 'publishable_token',
      secret_token: 'secret_token',
      endpoint: 'https://cloud.iexapis.com/v1'
    )

    @quote = @client.quote('MSFT')
  end
end
