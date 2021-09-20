module SeedsServices
  class CreateUsers < ApplicationService
    def call
      @logger.info 'Processing Users seed file'
      User.destroy_all # destroy all user data first
      @logger.info 'Deleted all data from User model'
      user_count = 0
      30.times do
        User.create(approved: true, email: "test_user+#{user_count}@test.com", password: 'test12345', full_name: "test_user #{user_count}", username: "test_user #{user_count}")
        user_count += 1
      end
      @logger.info '30 user data created'
    end
  end
end
