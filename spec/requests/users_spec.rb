require 'rails_helper'

RSpec.describe 'Users', type: :request do
  let(:user) { create(:user) }
  let(:pending_user) { create(:pending_user) }

  it 'sign in user' do
    sign_in user
    get stock_markets_path
    expect(response).to have_http_status(:found)
  end

  it 'signs out user' do
    sign_out user
    get root_path
    expect(response).to have_http_status(:found)
  end

  it 'cant sign in pending users' do
    sign_in pending_user
    get stock_markets_path
    expect(response).not_to render_template(:index)
  end
end
