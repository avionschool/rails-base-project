class MyStock < ApplicationRecord
    # before_save :price_x_100
    after_create :create_buy_transaction
    before_destroy :create_sell_transaction
    # after_initialize do |user|
    #     self.stock_price_bough = (self.stock_price_bough.to_f / 100)
    # end
    
    # after_find :price_x_100
    private

    def create_buy_transaction
        rec = MyStock.last
        trans = TransactionTable.new(
            transaction_text: "You BOUGHT #{rec.stock_count_bought} of #{rec.stock_name_bought} at $#{rec.stock_price_bough.to_f / 100}/stock",
            transction_type: "buy",
            user_id: rec.user_id)
        trans.save      
    end
    # self.price = price *100 
    def create_sell_transaction
        # byebug
        # puts "transaction : SOLD #{stock_name_bought}"
        client = IEX::Api::Client.new(
            publishable_token: 'pk_8602e5e277754e71b57e9e56bad4d6a8',
            secret_token: 'sk_bedf09f6562c479381c77a73f4788d6d',
            endpoint: 'https://cloud.iexapis.com/v1'
          )
        
        quote = client.quote(stock_name_bought)
        latest_price = quote.latest_price

        trans = TransactionTable.new(transaction_text: "You SOLD #{stock_count_bought} of #{stock_name_bought} at CURRENT PRICE: $#{latest_price}/stock PREVIOUS PRICE: $#{stock_price_bough.to_f / 100}/stock",
            transction_type: "sell",
            user_id: user_id)
        trans.save
    end

    # def price_x_100
    #     byebug
    #     self.stock_price_bough = (self.stock_price_bough * 100)
    # end

    # def add_current_user_id_to_my_stocks
    #     self.user_id = current_user.id
    # end
end
