module SeedsServices
  class CreateMinibookEntries < ApplicationService
    def call
      @logger.info 'Processing Minibook Entries seed file'
      MinibookEntry.destroy_all
      @logger.info 'Deleted all data from Minibook Entries'
      @minibook = MiniBook.all
      @minibook.each do |book|
        entry_count = 0
        5.times do
          MinibookEntry.create(mini_book_id: book.id, date_minib_entry: Time.zone.today, minibook_entry_description: "Payment for something#{entry_count}", or_vat_reg_tin_minib: 'asdf345678', debit_minib: 50_000.00, credit_minib: 30_000.00, minibook_balance: 20_000.00)
          entry_count += 1
        end
      end
      @logger.info '10 Mainbook entries data created'
    end
  end
end
