# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
Role.create(role: "admin")
Role.create(role: "trader")

User.create(email: "chestergarett@gmail.com", password: "password", username: "chestergarett")
User.create(email: "chestergarett1@gmail.com", password: "password", username: "chestergarett1")
User.create(email: "chestergarett2@gmail.com", password: "password", username: "chestergarett2")
User.create(email: "chestergarett3@gmail.com", password: "password", username: "chestergarett3")
admin = User.create(email: "admin@gmail.com", password: "password", username: "admin_user")
admin.roles << [Role.find_by(role: "admin")]