require 'rails_helper'

RSpec.describe 'BrokerStocksController', type: :request do
  let(:buyer) do
    Buyer.create(
      email: 'buyer@email.com',
      approved: true,
      password: 'password',
      password_confirmation: 'password'
    )
  end

  it 'display all stocks bought by buyer' do
    get broker_stocks_path
    # get buyer_stocks_path
    expect(response.status).to be(200)
  end
end
