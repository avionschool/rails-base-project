class UpdateStocksTable < ActiveRecord::Migration[6.0]
  def change
    add_column :stocks, :symbol, :string
    add_column :stocks, :companyname, :string
    remove_column :stocks, :name, :string
    remove_column :stocks, :price, :float
    remove_column :stocks, :quantity, :decimal
  end
end
