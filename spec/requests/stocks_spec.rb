require 'rails_helper'

RSpec.describe 'Stocks', type: :request do
  describe 'GET /stocks' do
    it 'has 200 status' do
      create(:stock)
      get stocks_path(1)
      expect(response).to have_http_status(:ok)
    end
  end
end
