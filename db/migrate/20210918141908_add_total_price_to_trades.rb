class AddTotalPriceToTrades < ActiveRecord::Migration[6.0]
  def change
    add_column :trades, :total_price, :float
  end
end
