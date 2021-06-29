require 'rails_helper'

RSpec.describe BuyerStock, type: :model do
  let!(:buyer) { Buyer.create(email: 'e@email.com', first_name: 'Light', last_name: 'Yagami', username: 'Kira', password: 'password', password_confirmation: 'password') }
  let(:buyer_stock) { buyer.buyer_stocks.build(symbol: 'MC', quantity: 2, company_name: 'Microsoft Corp') }

  context 'with validations/stock should fail to save' do
    it 'is not valid without symbol' do
      buyer_stock.symbol = 'MC'

      expect(buyer_stock).to be_valid
    end

    it 'is not valid without a company_name' do
      buyer_stock.company_name = nil

      expect(buyer_stock).not_to be_valid
    end
  end
end
