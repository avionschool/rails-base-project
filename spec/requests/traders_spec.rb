require 'rails_helper'

RSpec.describe 'Traders', type: :request do
  let(:trader) { create(:trader) }
  let(:trader_pending) { create(:trader_pending) }

  describe 'User sign in and log out' do
    it 'returns the index page' do
      get root_path
      expect(response).to have_http_status(:ok)
    end

    it 'signs trader in' do
      sign_in trader
      get trader_portfolio_path
      expect(response).to have_http_status(:ok)
    end

    it 'signs admins out' do
      sign_out trader
      get root_path
      expect(response).to have_http_status(:ok)
    end
  end
end
