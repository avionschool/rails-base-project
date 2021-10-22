class CreateMinibookEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :minibook_entries do |t|
      t.integer :mini_book_id
      t.datetime :date_minib_entry
      t.string :minibook_entry_description
      t.string :or_vat_reg_tin_mainib
      t.float :debit_minib
      t.float :credit_minib
      t.float :minibook_balance

      t.timestamps
    end
  end
end
