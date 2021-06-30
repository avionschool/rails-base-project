require 'rails_helper'

RSpec.describe 'BuyerStocksControllers', type: :request do
  let!(:buyer) { Buyer.create(email: 'buy@email.com', first_name: 'Light', last_name: 'Yagami', username: 'Kira', password: '1234567', password_confirmation: '1234567') }
  let!(:broker) { Broker.create(email: 'e@email.com', first_name: 'Light', last_name: 'Yagami', username: 'Kirara', approved: true, password: 'password') }
  let!(:broker_stock) { broker.broker_stocks.create(symbol: 'MMCC', price: 260.76, company_name: 'Microsoft Corp') }
  # let!(:buyer_stock) { buyer.buyer_stocks.create(symbol: 'MMC', quantity: 10, company_name: 'Microsoft Corp') }

  before do
    sign_in buyer
  end

  context 'when GET buyer_stocks' do
    it 'gets the buyer_stock index' do
      get buyer_stocks_path
      expect(response).to have_http_status(:ok)
    end

    # it 'gets the buyer_stock show template' do
    #   get buyer_stock_path(buyer_stock)
    #   expect(response).to have_http_status(:ok)
    # end
  end

  context 'when Post and Patch buyer_stocks' do
    it 'posts a new buyer_stock' do
      post buyer_stocks_path(buyer), params: { buyer_stock: { broker_stock_id: broker_stock.id } }
      expect(response).to redirect_to(buyer_stocks_path)
    end
  end
end
