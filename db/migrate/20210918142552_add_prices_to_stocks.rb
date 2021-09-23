class AddPricesToStocks < ActiveRecord::Migration[6.0]
  def change
    add_column :stocks, :prices, :text, array: true, default: []
  end
end
