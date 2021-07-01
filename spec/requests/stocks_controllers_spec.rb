require 'rails_helper'

RSpec.describe 'StocksControllers', type: :request do
  let(:user) { create(:user) }

  describe 'GET marketplace' do
    it 'returns a redirect response not logged_in' do
      get marketplace_path
      expect(response).to have_http_status(:found)
    end

    it 'returns a success response if logged_in' do
      sign_in user
      get marketplace_path
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET stock_search' do
    it 'returns a redirect response not logged_in' do
      get search_stock_path
      expect(response).to have_http_status(:found)
    end

    it 'returns a success response if logged_in' do
      sign_in user
      get search_stock_path
      expect(response).to have_http_status(:ok)
    end
  end
end
