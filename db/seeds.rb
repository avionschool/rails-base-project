# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create(email: 'admin@email.com', password: 'admin123')

client = IEX::Api::Client.new(
    publishable_token: Rails.application.credentials.iex_global_api[:publishable],
    secret_token: Rails.application.credentials.iex_global_api[:secret],
    endpoint: 'https://sandbox.iexapis.com/v1'
)

Market.destroy_all
file = File.open('app/api/stock_lists/market_symbol.txt')
file_data = file.readlines.map(&:chomp)
    
file_data.each do |data|
    Market.create( name: client.company(data).company_name, market_symbol: data, curr_price: client.price(data))
end
