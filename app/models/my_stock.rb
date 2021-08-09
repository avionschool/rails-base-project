class MyStock < ApplicationRecord
    after_create :create_buy_transaction
    before_destroy :create_sell_transaction
    # before_save :price_x_100
    # after_find :price_x_100
    private

    def create_buy_transaction
        rec = MyStock.last
        trans = TransactionTable.new(transaction_text: "You BOUGHT #{rec.stock_count_bought} of #{rec.stock_name_bought} at \n$#{rec.stock_price_bough}/stock", transction_type: "buy")
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

        trans = TransactionTable.new(transaction_text: "You SOLD #{stock_count_bought} of #{stock_name_bought} at \nCURRENT PRICE: $#{latest_price}/stock PREVIOUS PRICE: $#{stock_price_bough}/stock", transction_type: "sell")
        trans.save
    end

    # def price_x_100
    #     self.stock_price_bough = self.stock_price_bough * 100
    # end
end
