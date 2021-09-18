# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'
require 'open-uri'

url = "https://sandbox.iexapis.com/beta/ref-data/symbols?token=#{Rails.application.credentials.iex_global_api[:publishable_token]}"
market_symbols = URI.open(url).read
sample_stocks = JSON.parse(market_symbols)

sample_stocks.each do |data|
    client = IEX::Api::Client.new(
      publishable_token: Rails.application.credentials.iex_global_api[:publishable_token],
      secret_token: Rails.application.credentials.iex_global_api[:secret_token],
      endpoint: 'https://sandbox.iexapis.com/v1'
      )

  begin
    SampleStock.connection
    SampleStock.create(market_symbol: data, curr_price: client.price(data), logo_url: client.logo(data))
    puts SampleStock
  rescue StandardError
    #puts "symbol not found"
    nil
  end
    p "populated database :)"
end
