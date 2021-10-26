module SeedsServices
  class CreateMainbookEntries < ApplicationService
    def call
      @logger.info 'Processing Mainbook entries seed file'
      MainBook.destroy_all # destroy all mainbook entry data first
      @logger.info 'Deleted all data from Mainbook model'
      @user = User.all
      @user.each do |uid|
        entry_count = 0
        15.times do
          MainBook.create(user_id: uid.id, date_mainb: Time.zone.today, mainbook_description: "Payment for something#{entry_count}", or_vat_reg_tin_mainb: 'asdf345678123', debit_mainb: 50_000.00, credit_mainb: 30_000.00, balance_mainb: 20_000.00)
          entry_count += 1
        end
      end
      @logger.info '10 Mainbook entries data created per user'
    end
  end
end
