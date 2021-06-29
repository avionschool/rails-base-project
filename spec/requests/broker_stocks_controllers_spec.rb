require 'rails_helper'

RSpec.describe 'BrokerStocksController', type: :request do
  let!(:broker) { Broker.create(email: 'be@email.com', first_name: 'Boruto', last_name: 'Yagami', username: 'userless', password: 'passwordbuyer', approved: true) }
  let!(:broker_stock) { broker.broker_stocks.create(symbol: 'MMC', company_name: 'Microsoft Corp') }

  before do
    sign_in broker
  end

  context 'with GET /broker_stocks' do
    it 'gets all broker stocks' do
      get broker_stocks_path
      expect(response).to have_http_status(:success)
    end

    it 'gets new' do
      get new_broker_stock_path
      expect(response).to have_http_status(:success)
    end

    it 'gets the broker_stock show template' do
      get broker_stock_path(broker_stock)
      expect(response).to have_http_status(:success)
    end
  end

  context 'with POST /broker_stocks' do
    it 'creates broker stocks' do
      post broker_stocks_path(broker), params: { broker_stock: { symbol: 'A', price: 200, company_name: 'Agilent' } }
      expect(response).to redirect_to(broker_stocks_path)
    end
  end
end
