require 'rails_helper'

RSpec.describe 'TouristsControllers', type: :request do
  let!(:tourist) { Tourist.create(email: 'tourist@email.com', first_name: 'TouristOne', last_name: 'Tourist', address: 'Kyoto, Japan', birth_date: Date.new(1999, 8, 10), password: '1234567') }

  before { sign_in(tourist) }

  context 'when GET tourists' do
    it 'works! (now write some real specs)' do
      get tourist_path(tourist)
      expect(response).to have_http_status(:ok)
    end
  end
end
