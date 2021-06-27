require 'rails_helper'

RSpec.describe 'UserTransactions', type: :request do
  describe 'GET /user_transactions' do
    let!(:buyer) { Buyer.create(email: 'buy@email.com', password: '1234567', password_confirmation: '1234567') }

    before do
      sign_in buyer
    end

    it 'Gets the index of user_transactions' do
      get user_transactions_path
      expect(response).to have_http_status(:ok)
    end
  end
end
