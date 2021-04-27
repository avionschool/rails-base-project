class HomeController < ApplicationController
  def index
    #     Redirect to Landing Page
    render :index
  end

  # def index
  #     require 'iex-ruby-client'

  def show
    require 'iex-ruby-client'
    @client = IEX::Api::Client.new
    @portfolio = BuyersStock.where(user_id: current_user.id).collect do |x|
      {
        stock_id: x.stock_id,
          name: Stock.find(x.stock_id).name,
          volume: x.volume,
          price: Stock.find(x.stock_id).price,
          code: Stock.find(x.stock_id).code
      }
    end
    @top10 = Stock.most_active
    render :show
  end

  # def index
  #     require 'iex-ruby-client'

  #     @client = IEX::Api::Client.new(
  #         publishable_token: "#{ENV['IEX_API_PUBLISHABLE_TOKEN']}",
  #         secret_token: "#{ENV['IEX_API_SECRET_TOKEN']}",
  #         endpoint: "https://cloud.iexapis.com/v1"
  #     )
  #    # @quote = @client.quote('MSFT')
  #     @test_print ="TEST" #"#{@quote.latest_price}, #{@quote.change}, #{@quote.change_percent}, #{@quote.change_percent_s}"
  #     @historial_prices = @client.ref_data_symbols #@client.historical_prices('MSFT')

  #     #historial_price = @historial_prices.first
  #     #@test = historial_price.open

  # end
end
