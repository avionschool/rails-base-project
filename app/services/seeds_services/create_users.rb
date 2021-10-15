module SeedsServices
  class CreateUsers < ApplicationService
    def call
      @logger.info 'Processing Users seed file'
      User.destroy_all # destroy all user data first
      @logger.info 'Deleted all data from User model'
      user_count = 0
      10.times do
        User.create(email: "dummy_user+#{user_count}@abc.com", encrypted_password: 'abc12345', full_name: "abc_user_ #{user_count}", username: "abc_ #{user_count}", company: 'ABC Tech Corporation')
        user_count += 1
      end
      @logger.info '10 user data created'
    end
  end
end
