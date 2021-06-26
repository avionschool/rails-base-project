require 'rails_helper'

RSpec.describe 'UserStocksControllers', type: :request do
  let(:buyer) { create(:buyer_user) }
  let(:broker) { create(:broker_user) }
  let(:admin) { create(:admin_user) }

  describe 'GET #myportfolio response for different user' do
    it 'returns a redirect response not logged_in' do
      get my_portfolio_path
      expect(response).to have_http_status(:found)
    end

    it 'returns a success response if current user is buyer or broker' do
      sign_in buyer
      get my_portfolio_path
      expect(response).to have_http_status(:ok)
    end

    it 'returns a success response if current user is broker' do
      sign_in broker
      get my_portfolio_path
      expect(response).to have_http_status(:ok)
    end

    it 'returns a redirect response if currentuser is admin' do
      sign_in admin
      get my_portfolio_path
      expect(response).to have_http_status(:found)
    end
  end

  describe 'GET #transaction response for different user' do
    it 'returns a redirect response not logged_in' do
      get transactions_path
      expect(response).to have_http_status(:found)
    end

    it 'returns a success response if current user is buyer' do
      sign_in buyer
      get transactions_path
      expect(response).to have_http_status(:ok)
    end

    it 'returns a success response if current user is broker' do
      sign_in broker
      get transactions_path
      expect(response).to have_http_status(:ok)
    end

    it 'returns a success response if currentuser is admin' do
      sign_in admin
      get transactions_path
      expect(response).to have_http_status(:ok)
    end
  end
end
