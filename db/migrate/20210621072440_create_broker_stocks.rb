class CreateBrokerStocks < ActiveRecord::Migration[6.0]
  def change
    create_table :broker_stocks do |t|
      t.references :user, null: false, foreign_key: true
      t.references :stock, null: false, foreign_key: true

      t.timestamps
    end
  end
end
