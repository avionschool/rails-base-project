class CreateBrokerStocks < ActiveRecord::Migration[6.0]
  def change
    create_table :broker_stocks do |t|
      t.references :broker
      t.string :symbol
      t.integer :price
      t.string :company_name
      t.timestamps
    end
  end
end
