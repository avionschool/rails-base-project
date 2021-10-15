class CreateMainBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :main_books do |t|
      t.integer :user_id
      t.datetime :date_mainb
      t.string :mainbook_description
      t.string :or_vat_reg_tin_mainb
      t.float :debit_mainb
      t.float :credit_mainb
      t.float :balance_mainb

      t.timestamps
    end
  end
end
