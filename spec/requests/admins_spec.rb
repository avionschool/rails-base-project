require 'rails_helper'

RSpec.describe 'Admins', type: :request do
  let(:admin) do
    Admin.create(
      email: 'admin@email.com',
      approved: true,
      password: 'password',
      password_confirmation: 'password'
    )
  end

  it 'display index page of broker' do
    get root_path
    expect(response.status).to be(302)
  end
end
