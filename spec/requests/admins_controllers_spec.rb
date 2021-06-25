require 'rails_helper'

RSpec.describe 'AdminsControllers', type: :request do
  # let!(:admin) { Admin.create(email: 'a@email.com', password: '1234567', password_confirmation: '1234567') }

  before do
    Admin.create(email: 'a@email.com', password: '1234567', password_confirmation: '1234567')
    post admins_sign_in_path, params: { email: 'a@email.com', password: '1234567' }
  end

  describe 'GET /admins' do
    it 'get index' do
      get admins_path
      expect(response).to have_http_status(:ok)
    end

    it 'gets new' do
      get new_admin_path
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST /admins' do
    it 'sign in admin' do
      post admins_path, params: { admin: { email: 'bc@email.com', password: '1234567', password_confirmation: '1234567' } }
      expect(response).to redirect_to(admins_path)
    end
  end
end
