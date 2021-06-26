require 'rails_helper'

RSpec.describe 'BrokersControllers', type: :request do
  let!(:admin) { Admin.create(email: 'a@email.com', password: '1234567', password_confirmation: '1234567') }
  let!(:broker) { Broker.create(email: 'e@email.com', password: 'password', password_confirmation: 'password') }

  before do
    post admins_sign_in_path, params: { email: admin.email, password: admin.password }
  end

  context 'when GET brokers' do
    it 'gets all brokers in index' do
      get admin_brokers_path(admin)
      expect(response).to have_http_status(:ok)
    end

    it 'gets broker in show' do
      get admin_broker_path(admin, broker)
      expect(response).to have_http_status(:ok)
    end

    it 'gets new template' do
      get new_admin_broker_path(admin)
      expect(response).to have_http_status(:ok)
    end

    it 'gets edit template' do
      get edit_admin_broker_path(admin, broker)
      expect(response).to have_http_status(:ok)
    end
  end

  context 'when Post and Update broker' do
    it 'Post a new broker' do
      post admin_brokers_path(admin), params: { broker: { email: 'br@email.com', password: 'password' } }
      expect(response).to redirect_to(admin_brokers_path(admin))
    end

    it 'Updates a broker' do
      patch admin_broker_path(admin, broker), params: { broker: { email: 'br@email.com', password: 'password', password_confirmation: 'password', approved: true } }
      expect(response).to redirect_to(admins_path)
    end
  end
end
