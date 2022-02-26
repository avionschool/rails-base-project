require 'rails_helper'

RSpec.describe 'Admins', type: :request do
  let(:admin) { create(:admin) }

  describe 'Admin sign in and log out' do
    it 'returns the index page' do
      get root_path
      expect(response).to have_http_status(:found)
    end

    it 'signs admins in' do
      sign_in admin
      get '/admin/dashboard'
      expect(response).to be_successful
    end

    it 'signs admins out' do
      sign_out admin
      get root_path
      expect(response).to have_http_status(:found)
    end
  end
end
