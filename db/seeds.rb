# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Intialize all available stock codes

@client = IEX::Api::Client.new
@symbols = @client.ref_data_symbols

@symbols.each do |x|
    if Stock.find_by(code: x.symbol) == nil
        s = Stock.new(name: x.name, code: x.symbol, volume: 0)
        s.save!
    end
end