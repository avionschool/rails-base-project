# require 'json'
# require 'open-uri'

# url = "https://sandbox.iexapis.com/beta/ref-data/symbols?token=#{Rails.application.credentials.iex_global_api[:publishable_token]}"
# market_symbols = URI.open(url).read
# sample_stocks = JSON.parse(market_symbols)

# sample_stocks.each do |data|
#     client = IEX::Api::Client.new(
#       publishable_token: Rails.application.credentials.iex_global_api[:publishable_token],
#       secret_token: Rails.application.credentials.iex_global_api[:secret_token],
#       endpoint: 'https://sandbox.iexapis.com/v1'
#       )

#   begin
#     SampleStock.connection
#     SampleStock.create(market_symbol: data, curr_price: client.price(data), logo_url: client.logo(data))
#     puts SampleStock
#   rescue StandardError
#     #puts "symbol not found"
#     nil
#   end
#     p "populated database :)"
# end


#user seed#
User.destroy_all #destroy all user data first
user_count = 0
30.times do
  User.create(approved: true, email: "test_user+#{user_count}@test.com", password: "test12345", full_name: "test_user #{user_count}", username: "test_user #{user_count}" )
  user_count+=1
end
puts "30 users has been created"
#END user seed#

#admin seed#
Admin.destroy_all #destroy all user data first
Admin.create(email: "admin@admin.com", password: "test12345", full_name: "admin", username: "admin" )
puts "Admin has been created"
#END user seed#

#BEGIN portfolio seed

#BEGIN stock market seed#
Market.destroy_all
  client = IEX::Api::Client.new(
    publishable_token: Rails.application.credentials.iex_global_api[:publishable_token],
    secret_token: Rails.application.credentials.iex_global_api[:secret_token],
    endpoint: 'https://sandbox.iexapis.com/v1'
    )

  file = File.open('app/api/stock_lists/market_symbol.txt')
  file_data = file.readlines.map(&:chomp)

  file_data.each do |data|
    Market.create(market_symbol: data, curr_price: client.price(data), logo_url: client.logo(data))
    rescue StandardError
      nil
    end
  p "populated database :)"
#END Stock market seed#