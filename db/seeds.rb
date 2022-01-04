# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(email: "admin@test.com", password: "123123")

User.create!(email: "ayaya@ayaya.com", first_name: "AYAYA", last_name: "Test", password: "123123", password_confirmation: "123123")