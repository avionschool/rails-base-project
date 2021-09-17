require 'rails_helper'

RSpec.describe 'Stocks', type: :request do
  describe 'GET /stocks' do
    it 'has 200 status' do
      get stocks_path
      expect(response).to have_http_status(:ok)
    end
  end
end
