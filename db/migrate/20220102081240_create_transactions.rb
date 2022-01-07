class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.references :broker, null: false, foreign_key: false
      t.references :stock, null: false, foreign_key: false
      t.references :buyer, null: false, foreign_key: false
      t.string :ticker
      t.string :company_name
      t.string :stock_price
      t.string :quantity
      t.string :broker_name
      t.string :buyer_email
      t.timestamps
    end
  end
end
