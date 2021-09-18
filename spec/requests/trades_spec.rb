require 'rails_helper'

RSpec.describe 'Trades', type: :request do
  let(:stock) { create(:stock) }
  let(:user) { create(:user) }

  describe 'new trade' do
    it 'gets /stocks/:stock_id/trades/new' do
      get new_stock_trade_path(stock)
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'create trade' do
    before { sign_in user, scope: :user }

    it 'posts to /stocks/:stock_id/trades/new' do
      post create_trade_path(stock.code), params: { trade: { user_id: user.id, stock_code: stock.code, price: stock.current_price, quantity: 100, transaction_type: 'buy' } }
      expect(response).to have_http_status(:ok)
    end
  end
end
