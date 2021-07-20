require 'rails_helper'

RSpec.describe 'AdminsControllers', type: :request do
  let!(:admin) { Admin.create(email: 'admin@email.com', first_name: 'Admin', last_name: 'Last', password: '1234567') }

  before do
    sign_in(admin)
  end

  context 'when GET admins' do
    it 'shows the index page' do
      get admins_path
      expect(response).to have_http_status(:ok)
    end

    it 'shows the selected admin' do
      get admin_path(admin)
      expect(response).to have_http_status(:ok)
    end

    it 'shows the new admin template' do
      get new_admin_path
      expect(response).to have_http_status(:ok)
    end
  end

  context 'when POST and PATCH admins' do
    it 'creates a new admin' do
      post admins_path, params: { admin: { email: 'admin2@email.com', first_name: 'Admin', last_name: 'Last', birth_date: Date.new(1999, 10, 10), address: 'Kyoto, Japan', password: '1234567' } }
      expect(response).to redirect_to(admins_path)
    end

    it 'updates a new admin' do
      patch admin_path(admin), params: { admin: { email: 'admin4@email.com', first_name: 'Admin2', last_name: 'Last', birth_date: Date.new(1999, 10, 10), address: 'Kyoto, Japan', password: '1234567' } }
      expect(response).to redirect_to(admin_path(admin))
    end
  end
end
