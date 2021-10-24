require 'rails_helper'

RSpec.describe 'MainBooks', type: :request do
  # before(:create, &:skip_confirmation!)
  let(:confirmed_user) { create(:confirmed_user) }
  let(:user_pending) { create(:user_pending) }
  let(:mainbook_entries) { create(:mainbook_entries) }

  describe 'GET /main_books_controllers' do
    it 'returns the index page' do
      get root_path
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'User gets to access mainbook page' do
    before do
      sign_in confirmed_user
    end

    it 'returns the mainbook entries page' do
      get mainbook_entries_path
      expect(response).to have_http_status(:ok)
    end
  end
end
