# require 'rails_helper'

RSpec.describe 'Brokers', type: :request do
  let(:buyer) do
    Buyer.create(
      email: 'buyer@email.com',
      approved: true,
      password: 'password',
      password_confirmation: 'password'
    )
  end

  it 'display index page of buyer' do
    get buyers_path
    expect(response.status).to be(200)
  end
end
