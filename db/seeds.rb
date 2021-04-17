# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create role
# Role.new(role_name: "admin").save
# Role.new(role_name: "buyer").save
# Role.new(role_name: "broker").save

# # # Create user thru devise
# # # mimic registration

# user = User.new
# user.email = 'broker@gmail.com'
# user.username = 'broker'
# user.role_id = Role.find_by(role_name: "broker").id
# user.password = '123456'
# user.password_confirmation = '123456'
# user.save!

# user = User.new
# user.email = 'buyer@gmail.com'
# user.username = 'buyer'
# user.role_id = Role.find_by(role_name: "buyer").id
# user.password = '123456'
# user.password_confirmation = '123456'
# user.save!

# user = User.new
# user.email = 'admin@gmail.com'
# user.username = 'admin'
# user.role_id = Role.find_by(role_name: "admin").id
# user.password = '123456'
# user.password_confirmation = '123456'
# user.save!


# # # Transaction 1
# # # Create Stocks for broker
amount1 = 255.5
quantity1 = 4
total_amount1 = amount1 * quantity1

# Stock.create(name: "MSFT",
#           amount: total_amount1,
#           quantity: quantity1,
#           user_id: User.find_by(username: "broker").id)

Transaction.new(
    total_amount: total_amount1,
    quantity: quantity1,
    price: amount1,
    stock_id: Stock.first.id,
    seller_id: nil,
    buyer_id: User.find_by(username: "broker").id
).save!


# Transaction 2
amount2 = 250.5
quantity2 = 1
total_amount2 = amount2 * quantity2
# # Create Stocks for buyer
Stock.create(name: "MSFT",
            amount: total_amount2,
            quantity: quantity2,
            user_id: User.find_by(username: "buyer").id)

# # # buyer bought stocks to broker
stock1_update = Stock.first
stock1_update.amount = stock1_update.amount - Stock.second.amount
stock1_update.quantity = stock1_update.quantity - Stock.second.quantity
stock1_update.save!

# Create transactions
Transaction.new(
    total_amount: total_amount2,
    quantity: quantity2,
    price: amount2,
    stock_id: Stock.second.id,
    seller_id: User.find_by(username: "broker").id,
    buyer_id: User.find_by(username: "buyer").id
).save!

