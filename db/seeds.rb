# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
    @client = IEX::Api::Client.new(
        publishable_token: Rails.application.credentials.iex_publishable_token,
        secret_token: Rails.application.credentials.iex_secret_token,
        endpoint: 'https://sandbox.iexapis.com/v1'
    )

    @symbols = @client.ref_data_symbols
    @symbols.each do |x|
        Stock.create(symbol: x.symbol)
    end
    
