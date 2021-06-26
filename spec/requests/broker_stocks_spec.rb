require 'rails_helper'

RSpec.describe 'BrokerStocksController', type: :request do
  let(:broker) do
    Broker.create(
      email: 'broker@email.com',
      approved: true,
      password: 'password',
      password_confirmation: 'password'
    )
  end

  it 'display all stocks by broker' do
    get broker_stocks_path
    expect(response.status).to be(200)
  end
end
