class EditStocksTable < ActiveRecord::Migration[6.1]
  def change
    add_index :stocks, :code, unique: true
  end
end
