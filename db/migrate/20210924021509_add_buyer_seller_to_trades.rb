class AddBuyerSellerToTrades < ActiveRecord::Migration[6.0]
  def change
    add_column :trades, :buyer, :string
    add_column :trades, :seller, :string
  end
end
