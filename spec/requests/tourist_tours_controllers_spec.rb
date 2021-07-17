require 'rails_helper'

RSpec.describe 'TouristToursControllers', type: :request do
  let!(:admin) { create(:admin) }
  let!(:tourist) { create(:tourist) }
  let!(:agency) { create(:approved_agency) }
  let!(:tour) { create(:tour, agency: agency) }
  let!(:tourist_tour) { create(:tourist_tour, tourist: tourist, tour: tour) }

  describe 'GET tourist_tour index path request response for different users' do
    it 'returns a redirect response if not logged_in ' do
      get tourist_tours_path
      expect(response).to have_http_status(:found)
    end

    it 'returns a success response if current_user is tourist ' do
      sign_in(tourist)
      get tourist_tours_path
      expect(response).to have_http_status(:ok)
    end

    it 'returns a redirect response if current_user is agency ' do
      sign_in(agency)
      get tourist_tours_path
      expect(response).to have_http_status(:found)
    end

    it 'returns a redirect response if current_user is admin ' do
      sign_in(admin)
      get tourist_tours_path
      expect(response).to have_http_status(:found)
    end
  end

  describe 'GET /tourist_tours/new/:tour_id path (new tourist_tour) for different users' do
    it 'returns a redirect response if not logged_in ' do
      get new_tourist_tour_path(tour)
      expect(response).to have_http_status(:found)
    end

    it 'returns a redirect response if current_user is agency ' do
      sign_in(agency)
      get new_tourist_tour_path(tour)
      expect(response).to have_http_status(:found)
    end

    it 'returns a redirect response if current_user is admin ' do
      sign_in(admin)
      get new_tourist_tour_path(tour)
      expect(response).to have_http_status(:found)
    end

    it 'returns a success response if current_user is tourist ' do
      sign_in(tourist)
      get new_tourist_tour_path(tour)
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /tourist_tours/:id path (show tourist tour) for different users' do
    it 'returns a redirect response if not logged_in ' do
      get tourist_tours_path(tourist_tour)
      expect(response).to have_http_status(:unauthorized)
    end

    it 'returns a redirect response if current_user is agency ' do
      sign_in(agency)
      get tourist_tours_path(tourist_tour)
      expect(response).to have_http_status(:unauthorized)
    end

    it 'returns a redirect response if current_user is admin ' do
      sign_in(admin)
      get tourist_tours_path(tourist_tour)
      expect(response).to have_http_status(:unauthorized)
    end

    it 'returns a success response if current_user is tourist ' do
      sign_in(tourist)
      get tourist_tours_path(tourist_tour)
      expect(response).to have_http_status(:ok)
    end
  end
end
