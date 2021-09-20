module SeedsServices
  class CreateAdmins < ApplicationService
    def call
      @logger.info 'Processing Admin seed file'
      Admin.destroy_all # destroy all user data first
      @logger.info 'Deleted all data from Admin model'
      Admin.create(email: 'admin@admin.com', password: 'test12345', full_name: 'admin', username: 'admin')
      @logger.info 'Admin has been created'
    end
  end
end
