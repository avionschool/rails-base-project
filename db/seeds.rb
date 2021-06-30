# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# client = IEX::Api::Client.new(
#     publishable_token: Rails.application.credentials.iex_client[:publish_access_key],
#     secret_token: Rails.application.credentials.iex_client[:secret_access_key],
#     endpoint: 'https://sandbox.iexapis.com/v1'
#   )
# symbols = client.ref_data_symbols()
# nas_symbols = symbols.select{|symbol| symbol.exchange == 'NAS' }
# selected_symbols = (0... nas_symbols.length).select{ |x| x%30 == 30-1 }.map { |y| nas_symbols[y] } 

# selected_symbols.each do|stock| 
#   begin
#    Stock.find_or_create_by('ticker'=>stock.symbol, 'company' => client.company(stock.symbol).company_name,'price'=>client.price(stock.symbol))
#   rescue => exception 
#   end
# end