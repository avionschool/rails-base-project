require 'rails_helper'

RSpec.describe 'BrokersControllers', type: :request do
  describe 'GET /brokers_controllers' do
    it 'Redirect to Broker main page' do
      get brokers_path
      expect(response).to have_http_status(:ok)
    end
  end
end
