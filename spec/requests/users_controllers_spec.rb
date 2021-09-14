require 'rails_helper'

RSpec.describe 'UsersControllers', type: :request do
  describe 'GET /users_controllers' do
    it 'returns the index page' do
      get root_path
      expect(response).to have_http_status(:ok)
    end
  end
end
