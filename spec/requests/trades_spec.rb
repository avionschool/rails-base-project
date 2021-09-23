require 'rails_helper'

RSpec.describe 'Trades', type: :request do
  let(:stock) { create(:stock) }
  let(:stock_price_not_updated) { Stock.create(code: 'AAAA', name: 'Apple', current_price: 1, price_updated_at: 10.minutes.ago) }
  let(:user) { create(:user) }
  let(:user_stock) { UserStock.create(user_id: user.id, stock_code: stock.code, quantity: 1_000) }
  let(:wallet) { Wallet.create(user_id: user.id, running_balance: 1_000_000) }

  describe 'new trade' do
    it 'gets /stocks/:stock_id/trades/new' do
      sign_in user, scope: :user
      get new_stock_trade_path(stock)
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'create trade' do
    before do
      sign_in user, scope: :user
      stock
      Wallet.create(user_id: user.id, running_balance: 1_000_000)
    end

    it 'posts to /stocks/:stock_id/trades/new' do
      sign_in user, scope: :user
      post create_trade_path(stock.code), params: { trade: { user_id: user.id, stock_code: stock.code, price: stock.current_price, quantity: 100, transaction_type: 'buy' } }
      expect(response).to redirect_to new_stock_trade_path
    end

    it 'rerenders new if posts to /stocks/:stock_id/trades/new failed' do
      sign_in user, scope: :user
      post create_trade_path(stock.code), params: { trade: { user_id: user.id, stock_code: stock.code, price: stock.current_price, quantity: 100 } } # no transaction_type
      expect(response).to redirect_to(new_stock_trade_path(stock))
    end

    it 'updates running_balance on user wallet on "buy" transaction' do
      post create_trade_path(stock.code), params: { trade: { user_id: user.id, stock_code: stock.code, price: stock.current_price, quantity: 100, transaction_type: 'buy' } }
      expect(user.wallet.running_balance).to eq(900_000)
    end

    it 'updates running_balance on user wallet on "sell" trasaction' do
      user_stock
      post create_trade_path(stock.code), params: { trade: { user_id: user.id, stock_code: stock.code, price: stock.current_price, quantity: 100, transaction_type: 'sell' } }
      expect(user.wallet.running_balance).to eq(1_100_000)
    end

    it 'does not update running_balance on user wallet on "sell" transaction if user_stock quantity is 0 or nil' do
      post create_trade_path(stock.code), params: { trade: { user_id: user.id, stock_code: stock.code, price: stock.current_price, quantity: 100, transaction_type: 'sell' } }
      expect(user.wallet.running_balance).to eq(1_000_000)
    end

    it 'creates user_stock if it does not exists on "buy" transaction' do
      expect { post create_trade_path(stock.code), params: { trade: { user_id: user.id, stock_code: stock.code, price: stock.current_price, quantity: 100, transaction_type: 'buy' } } }.to change { user.user_stocks.count }.by(1)
    end

    it 'updates user_stock' do
      user_stock
      post create_trade_path(stock.code), params: { trade: { user_id: user.id, stock_code: stock.code, price: stock.current_price, quantity: 100, transaction_type: 'sell' } }
      expect(user.user_stocks.find_by(stock_code: stock.code).quantity).to eq(900)
    end

    it 'does not create trade if user does not have a wallet' do
      expect { post create_trade_path(stock.code), params: { trade: { user_id: user.id, stock_code: stock.code, price: stock.current_price, quantity: 10_000_000, transaction_type: 'buy' } } }.to change { user.trades.count }.by(0)
    end

    it 'does not create trade if user has insufficient balance on "buy" transaction' do
      wallet
      expect { post create_trade_path(stock.code), params: { trade: { user_id: user.id, stock_code: stock.code, price: stock.current_price, quantity: 10_000_000, transaction_type: 'buy' } } }.to change { user.trades.count }.by(0)
    end

    it 'does not create trade if user has insufficient quantity of stocks on "sell" transaction' do
      user_stock

      expect { post create_trade_path(stock.code), params: { trade: { user_id: user.id, stock_code: stock.code, price: stock.current_price, quantity: 10_000_000, transaction_type: 'sell' } } }.to change { user.trades.count }.by(0)
    end

    it 'does not create trade if stock price has been updated more than 5 minutes ago (UTC)' do
      expect { post create_trade_path(stock_price_not_updated.code), params: { trade: { user_id: user.id, stock_code: stock_price_not_updated.code, price: stock_price_not_updated.current_price, quantity: 100, transaction_type: 'buy' } } }.to change { user.trades.count }.by(0)
    end

    it 'updates the stock price automatically if trasaction failed and last update is more than 5 minutes ago' do
      post create_trade_path(stock_price_not_updated.code), params:  { trade:  { user_id: user.id, stock_code: stock_price_not_updated.code, price: stock_price_not_updated.current_price, quantity: 100, transaction_type: 'buy' } }
      expect(Stock.last.price_updated_at).to be_within(1.second).of DateTime.current
    end
  end
end
