module Seeders
    class InitDummyAccts < ApplicationService 
        def invoke
            @logger.info 'Initializing dummy accounts'
            User.destroy_all # destroy all user data first
            Wallet.destroy_all
            Holding.destroy_all
            TradeLog.destroy_all
            @logger.info 'Deleted all previous data for users'
            user_count = 0
            10.times do
              User.create(confirmed: true, email: "Test_#{user_count}@test.com", password: 'test12345', username: "Subject #{user_count}")
              user_count += 1
            end
            @logger.info '10 user data created'
            @logger.info 'Creating admin account'

            Admin.destroy_all
            Admin.create(email: "admin@devops.com", password: 'admin123')

            @logger.info 'Admin account created'
        end
    end
end