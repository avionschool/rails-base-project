class SampleStock < ApplicationRecord

  def self.list_stock(name)
    client = IEX::Api::Client.new(
      publishable_token: Rails.application.credentials.iex_global_api[:publishable_token],
      secret_token: Rails.application.credentials.iex_global_api[:secret_token],
      endpoint: 'https://sandbox.iexapis.com/v1'
    )
    #client.price(name)
    self.create(market_symbol: name, curr_price: client.price(name), logo_url: client.logo(name))
  end
end
