require 'rails_helper'

RSpec.describe 'Admins', type: :request do
  let(:admin) { create(:admin) }

  describe 'GET /sign_in' do
    it 'goes to sign in admin page' do
      get new_admin_session_path
      expect(response).to be_successful
    end
  end

  it 'signs in admin' do
    sign_in admin
    get admins_view_traders_path
    expect(response).to be_successful
  end

  it 'goes to approval section page' do
    sign_in admin
    get admins_approvals_path
    expect(response).to be_successful
  end

  it 'goes to adds a trader/user account page' do
    sign_in admin
    get admins_add_trader_path
    expect(response).to be_successful
  end

  it 'goes to view all transactions page' do
    sign_in admin
    get view_trader_transactions_path
    expect(response).to be_successful
  end

  it 'signs out admin' do
    sign_out admin
    get new_admin_session_path
    expect(response).to be_successful
  end
end
