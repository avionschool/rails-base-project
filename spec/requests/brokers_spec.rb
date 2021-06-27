# require 'rails_helper'

RSpec.describe 'Brokers', type: :request do
  let(:broker) do
    Broker.create(
      email: 'broker@email.com',
      approved: true,
      password: 'password',
      password_confirmation: 'password'
    )
  end

  it 'display index page of broker' do
    get brokers_path
    expect(response.status).to be(200)
  end
end
