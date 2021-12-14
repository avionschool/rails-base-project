# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

admins = User.create(
    [
        {
          email: 'pr@avion.com',
          password: 'hesucrypto',
          admin: true
        },
        {
          email: 'cc@avion.com',
          password: 'kristocurrency',
          admin: true
        }
    ]
)

users = User.create(
    [
        {
            email: 'asd@asd.com',
            password: '123456'
        },
        {
            email: 'stonks@asd.com',
            password: '123456',
            kind: 'broker'
        }
    ]
)

coins = Coin.create(
    [
        {
            target: 'USDT',
            base: 'BTC'
        },
        {
            target: 'USDT',
            base: 'ETH'
        },
        {
            target: 'USDT',
            base: 'XRP'
        },
        {
            target: 'USDT',
            base: 'AXS'
        },
        {
            target: 'USDT',
            base: 'BNB'
        }
    ]
)