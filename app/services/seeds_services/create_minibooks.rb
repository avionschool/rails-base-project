module SeedsServices
  class CreateMinibooks < ApplicationService
    def call
      @logger.info 'Processing Minibooks seed file'
      MiniBook.destroy_all
      @logger.info 'Deleted all data from MiniBook'
      @user = User.all
      @user.each do |uid|
        minibook_count = 0
        7.times do
          MiniBook.create(user_id: uid.id, minibook_name: "Minibook Samp#{minibook_count}", minibook_price: 5000)
          minibook_count += 1
        end
      end
      @logger.info '7 MiniBooks data created per user'
    end
  end
end
