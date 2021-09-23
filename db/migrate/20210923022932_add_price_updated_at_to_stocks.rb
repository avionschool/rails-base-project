class AddPriceUpdatedAtToStocks < ActiveRecord::Migration[6.0]
  def change
    add_column :stocks, :price_updated_at, :datetime, precision: 6
  end
end
