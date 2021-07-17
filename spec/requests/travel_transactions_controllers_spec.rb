require 'rails_helper'

RSpec.describe "TravelTransactionsControllers", type: :request do
  let!(:admin) { create(:admin) }
  let!(:tourist) { create(:tourist) }
  let!(:agency) { create(:approved_agency) }
  let!(:tour) { create(:tour, agency: agency) }
  let!(:tourist_tour) { create(:tourist_tour, tourist: tourist, tour: tour) }
  let!(:travel_transaction) { create(:travel_transaction, tourist_tour: tourist_tour, agency: agency) }

  describe 'GET  /travel_transactions index path request response for different users' do
    it 'returns a redirect response if not logged_in ' do
      get travel_transactions_path
      expect(response).to have_http_status(:found)
    end

    it 'returns a success response if current_user is tourist ' do
      sign_in(tourist)
      get travel_transactions_path
      expect(response).to have_http_status(:ok)
    end

    it 'returns a success response if current_user is agency ' do
      sign_in(agency)
      get travel_transactions_path
      expect(response).to have_http_status(:ok)
    end

    it 'returns a success response if current_user is admin ' do
      sign_in(admin)
      get travel_transactions_path
      expect(response).to have_http_status(:ok)
    end
  end

end
