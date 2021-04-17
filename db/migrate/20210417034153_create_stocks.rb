class CreateStocks < ActiveRecord::Migration[6.0]
  def change
    create_table :stocks do |t|
      t.string :name
      t.decimal :amount
      t.integer :quantity

      t.timestamps

      t.references :user
    end
  end
end
