require 'rails_helper'

RSpec.describe 'BuyerStocksControllers', type: :request do
  describe 'GET /buyer_stocks' do
    it 'gets index' do
      get buyer_stocks_path
      expect(response).to have_http_status(:ok)
    end
  end
end
