# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#  client = Stock.sandbox_api
#  iex_client = Stock.iex_api
#  symbols = client.ref_data_symbols()
#  nas_symbols = symbols.select{|symbol| symbol.exchange == 'NAS' }
#  selected_symbols = (0... nas_symbols.length).select{ |x| x%5 == 5-1 }.map { |y| nas_symbols[y] } 

# selected_symbols.each do|stock| 
#   begin
#    Stock.find_or_create_by('ticker'=>stock.symbol, 'name' => client.company(stock.symbol).company_name,'last_price'=>client.price(stock.symbol))
#   rescue => exception 
#   end
# end

# User.create!([
#   {username:'stockjobberadmin', email: "admin@stockjobber.com", password: "password", password_confirmation: "password", role: 'admin', approved: true},
#   {username:'eileenadmin', email: "eileen_admin@stockjobber.com", password: "password", password_confirmation: "password", role: 'admin', approved: true},
#   {username:'ralphadmin', email: "ralph_admin@stockjobber.com", password: "password", password_confirmation: "password", role: 'admin', approved: true}
# ])