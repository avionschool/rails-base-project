class Cryptocurrency < ApplicationRecord
  def current_price
    api_key = "ce205881-4940-48a0-814e-3e4bb539eaeb"
    url = "https://pro-api.coinmarketcap.com/v1/cryptocurrency/quotes/latest"
    symbol = self.symbol
    query = {
        "symbol" => symbol
    }
    headers = {
        "X-CMC_PRO_API_KEY" => api_key,
        "Accepts" => "application/json"
    }
    request = HTTParty.get(url, :headers => headers, :query => query)
    puts request
    
    response = JSON.parse(request.body)["data"][symbol]["quote"]["USD"]["price"]
  end
end
