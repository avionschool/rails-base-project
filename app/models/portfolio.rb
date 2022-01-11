class Portfolio < ApplicationRecord
    belongs_to :wallet
    belongs_to :coin
    has_many :orders

    def self.update_portfolio(order)
        mult = 1
        if order.kind=="buy"
            mult=1
        elsif order.kind == "sell"
            mult=-1
        end
        
        if Portfolio.exists?(coin_id: order.coin_id)
            por = Portfolio.find_by(coin_id: order.coin_id)
            Portfolio.update(por.id, {
                :amount => por.amount + order.quantity * mult
            })
        else
            Portfolio.create!({
                :symbol => Coin.find(order.coin_id).base,
                :amount => order.quantity,
                :wallet_id => order.wallet_id,
                :coin_id => order.coin_id
            })
        end
    end
end
