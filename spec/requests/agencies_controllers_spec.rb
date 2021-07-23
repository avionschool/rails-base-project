require 'rails_helper'

RSpec.describe 'AgenciesControllers', type: :request do
  let!(:agency) { Agency.create(email: 'agency@email.com', agency_name: 'AgencyOne', address: 'address', password: '1234567') }
  let!(:admin) { Admin.create(email: 'admin@email.com', first_name: 'Admin', last_name: 'Last', password: '1234567') }

  before { sign_in(admin) }

  context 'when GET agencies' do
    it 'gets all agencies' do
      get agencies_path
      expect(response).to have_http_status(:ok)
    end

    it 'shows a specific agency' do
      get agency_path(agency)
      expect(response).to have_http_status(:ok)
    end
  end

  context 'when PATCH agencies' do
    it 'updates a specific agency' do
      patch agency_path(agency), params: { agency: { email: 'agency5@email.com', agency_name: 'AgencyOne', password: '1234567', verified_by: admin.id } }
      expect(response).to redirect_to(admins_path)
    end
  end
end
