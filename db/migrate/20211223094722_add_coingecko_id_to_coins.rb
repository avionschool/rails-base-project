class AddCoingeckoIdToCoins < ActiveRecord::Migration[6.0]
  def change
    add_column :coins, :coingecko_id, :string
  end
end
