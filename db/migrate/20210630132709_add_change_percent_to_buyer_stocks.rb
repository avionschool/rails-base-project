class AddChangePercentToBuyerStocks < ActiveRecord::Migration[6.0]
  def change
    add_column :buyer_stocks, :change_percent, :float
  end
end
