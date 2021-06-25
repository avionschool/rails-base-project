class NameChangeBrokersStocksToBrokerStocks < ActiveRecord::Migration[6.0]
  def change
    rename_table :brokers_stocks, :broker_stocks
    rename_table :buyers_stocks, :buyer_stocks
  end
end
