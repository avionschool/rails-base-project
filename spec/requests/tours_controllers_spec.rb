require 'rails_helper'

RSpec.describe 'ToursControllers', type: :request do
  let!(:admin) { create(:admin) }
  let!(:agency) { create(:approved_agency) }
  let!(:tour) { create(:tour, agency: agency) }

  before { sign_in(agency) }

  context 'when GET in tours' do
    it 'gets all active tours' do
      get tours_path
      expect(response).to have_http_status(:ok)
    end

    it 'gets all active tours if signed in as admin' do
      sign_in(admin)
      get tours_path
      expect(response).to have_http_status(:ok)
    end

    it 'gets the specifc tour' do
      get tour_path(tour)
      expect(response).to have_http_status(:ok)
    end

    it 'gets the new tour template' do
      get new_tour_path
      expect(response).to have_http_status(:ok)
    end

    it 'gets the edit tour template' do
      get edit_tour_path(tour)
      expect(response).to have_http_status(:ok)
    end
  end

  context 'when POST and PATCH tours' do
    it 'posts a new tour' do
      post tours_path, params: { tour: { name: 'Boracay', location: 'Boracay', duration: 3, price: 300, agency: agency } }
      expect(response).to redirect_to(tours_path)
    end

    it 'updates a tour' do
      patch tour_path(tour), params: { tour: { name: 'Boracay', location: 'Boracay', duration: 3, price: 300, agency: agency } }
      expect(response).to redirect_to(tour_path)
    end
  end
end
