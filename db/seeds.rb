# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# User Types
admin = UserType.find_or_create_by( user_type: 'admin' )
broker = UserType.find_or_create_by( user_type: 'broker' )
buyer = UserType.find_or_create_by( user_type: 'buyer' )

# Test Users

User.find_or_create_by(email: "admin@test.com") do |user|
  user.first_name = "Admin"
  user.last_name = "Adminson"
  user.user_type_id = admin.id
  user.verified = true
  user.password = "password"
  user.password_confirmation = "password"
end

User.find_or_create_by(email: "broker@test.com") do |user|
  user.first_name = "Broker"
  user.last_name = "Brokerson"
  user.user_type_id = broker.id
  user.verified = true
  user.password = "password"
  user.password_confirmation = "password"
end

User.find_or_create_by(email: "broker2@test.com") do |user|
  user.first_name = "Broker2"
  user.last_name = "Brokerson"
  user.user_type_id = broker.id
  user.verified = true
  user.password = "password"
  user.password_confirmation = "password"
end

User.find_or_create_by(email: "buyer@test.com") do |user|
  user.first_name = "Buyer"
  user.last_name = "Buyerson"
  user.user_type_id = buyer.id
  user.verified = true
  user.password = "password"
  user.password_confirmation = "password"
end

User.find_or_create_by(email: "buyer2@test.com") do |user|
  user.first_name = "Buyer2"
  user.last_name = "Buyerson"
  user.user_type_id = buyer.id
  user.verified = true
  user.password = "password"
  user.password_confirmation = "password"
end