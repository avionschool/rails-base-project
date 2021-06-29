class CreateUserTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :user_transactions do |t|
      t.belongs_to :buyer
      t.belongs_to :broker_stock
      t.integer :quantity, default: 1
      t.float :total_price
      t.timestamps
    end
  end
end
