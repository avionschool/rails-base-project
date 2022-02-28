# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create(email: 'admin@nofomo.com', password: 'nofomo123')


client = IEX::Api::Client.new(
  publishable_token: Rails.application.credentials.iex[:api_token],
  secret_token: Rails.application.credentials.iex[:secret_token],
  endpoint: 'https://sandbox.iexapis.com/v1'
)

Market.destroy_all
file = File.open('app/files/market_symbols.txt')

file_data = file.readlines.map(&:chomp)

file_data.each do |symbol|
  Market.create(name: symbol, current_price: client.price(symbol))
rescue StandardError
  nil
end


