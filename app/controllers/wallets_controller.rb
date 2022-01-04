class WalletsController < ApplicationController
  def index
    @api_key = ENV["COINMARKET_API_KEY"]
    @url = "https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest"
    @headers = {
        "X-CMC_PRO_API_KEY" => @api_key,
        "Accepts" => "application/json"
    }
    @request = HTTParty.get(@url, :headers => @headers)
    
    @response = JSON.parse(@request.body)["data"]
  end
end
