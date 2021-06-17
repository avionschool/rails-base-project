require 'rails_helper'

RSpec.describe 'BuyersControllers', type: :request do
  describe 'GET /buyers_controllers' do
    it 'Redirect to buyer main page' do
      get buyers_path
      expect(response).to have_http_status(:ok)
    end
  end
end
