require 'rails_helper'

RSpec.describe 'Portfolios', type: :request do
  let(:user) { create(:user) }
  let(:pending_user) { create(:pending_user) }
  let(:market) { create(:market) }
  let(:buy_market) { create(:buy_market) }
  let(:sell_market) { create(:sell_market) }

  describe 'GET /index' do
    it 'returns the index page' do
      get root_path
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'User gets to open their portfolio' do
    before do
      sign_in user
    end

    it 'open user portfolio' do
      get users_path
      expect(response).to have_http_status(:ok)
    end

    it 'open user transaction history' do
      get user_transaction_path
      expect(response).to have_http_status(:ok)
    end

    it 'allow user to make a buy/sell' do
      market = create(:market)
      get new_user_portfolio_path(user_id: user.id ,market_id: market.id)
      expect(response).to have_http_status(:ok)
    end
  end
end
