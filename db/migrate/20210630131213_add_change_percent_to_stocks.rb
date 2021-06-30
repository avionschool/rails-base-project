class AddChangePercentToStocks < ActiveRecord::Migration[6.0]
  def change
    add_column :stocks, :change_percent, :float
  end
end
