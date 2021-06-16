class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.string :stock_code
      t.datetime :date_posted
      t.boolean :fulfilled
      t.decimal :price
      t.integer :volume
      t.decimal :total_value
      t.references :user, null: false, foreign_key: true
      t.references :broker_stock, null: false, foreign_key: true

      t.timestamps
    end
  end
end
