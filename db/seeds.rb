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
            base: 'USDT',
            target: 'BTC'
        },
        {
            base: 'USDT',
            target: 'ETH'
        },
        {
            base: 'USDT',
            target: 'XRP'
        },
        {
            base: 'USDT',
            target: 'AXS'
        },
        {
            base: 'USDT',
            target: 'BNB'
        }
    ]
)