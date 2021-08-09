class ChangeMyStocksStockPriceBoughToDecimal < ActiveRecord::Migration[6.0]
  def change
    change_column :my_stocks, :stock_price_bough, :decimal, precision: 8, scale: 2
  end
end
