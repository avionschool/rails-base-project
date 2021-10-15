module SeedsServices
  class CreateAdmin < ApplicationService
    def call
      @logger.info 'Processing Admin seed file'
      Admin.destroy_all
      @logger.info 'Deleted all data from Admin model'
      Admin.create(email: "abc.dev@tech.com", password: "test1234", username: "abcdev")
      @logger.info 'admin data created'
    end
  end
end