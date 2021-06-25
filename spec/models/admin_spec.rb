require 'rails_helper'

RSpec.describe Admin, type: :model do
  let!(:admin) do
    described_class.create(
      email: 'admin@email.com',
      password: 'password',
      password_confirmation: 'password'
    )
  end

  it 'is not valid without email' do
    admin.email = nil
    expect(admin).not_to be_valid
  end

  it 'is not valid without password' do
    admin.password = nil
    expect(admin).not_to be_valid
  end

  it 'Create a admin account' do
    expect(admin).to be_valid
  end
end
