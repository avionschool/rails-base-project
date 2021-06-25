require 'rails_helper'

RSpec.describe 'AdminSessionsController', type: :request do
  before do
    Admin.create(email: 'a@email.com', password: '1234567', password_confirmation: '1234567')
  end

  describe 'GET /admin_sessions' do
    it 'sign in admin' do
      get admins_sign_in_path
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST /admin_sessions' do
    it 'sign in admin' do
      post admins_sign_in_path, params: { email: 'a@email.com', password: '1234567' }
      expect(response).to redirect_to(admins_path)
    end
  end

  describe 'DELETE /admin_sessions' do
    it 'sign out admin' do
      delete logout_path
      expect(response).to redirect_to(admins_sign_in_path)
    end
  end
end
