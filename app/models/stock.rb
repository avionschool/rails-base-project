class Stock < ApplicationRecord

  def self.new_lookup(stock_symbol)
    client = IEX::Api::Client.new(
      publishable_token: Rails.application.credentials.iex_client[:publishable_token],
      secret_token: Rails.application.credentials.iex_client[:secret_token],
      endpoint: 'https://sandbox.iexapis.com/stable')
    begin  
      new(stock_symbol: stock_symbol, logo: client.company(stock_symbol).company_name, current_price: client.price(stock_symbol))
    rescue => exception
      return nil
    end    
  end

end
