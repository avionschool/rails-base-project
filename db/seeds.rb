# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(email: "admin@test.com", password: "123123")

User.create!(email: "test@user.com", first_name: "Test", last_name: "User", password: "123123", password_confirmation: "123123")
User.create!(email: "anotheruser@test.com", first_name: "Another User", last_name: "Test", password: "123123", password_confirmation: "123123")
User.create!(email: "ayaya@ayaya.com", first_name: "AYAYA", last_name: "Test", password: "123123", password_confirmation: "123123")

Stock.create!(stock_symbol: "AA", current_price: "7778")
Stock.create!(stock_symbol: "BB", current_price: "1112")
Stock.create!(stock_symbol: "CC", current_price: "20")
Stock.create!(stock_symbol: "DD", current_price: "30000")
Stock.create!(stock_symbol: "EE", current_price: "100")