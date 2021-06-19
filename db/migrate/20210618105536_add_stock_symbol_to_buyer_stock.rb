class AddStockSymbolToBuyerStock < ActiveRecord::Migration[6.0]
  def change
    add_column :buyer_stocks, :stockSymbol, :string
  end
end
