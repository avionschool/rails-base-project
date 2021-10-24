require 'rails_helper'

RSpec.describe 'MainBooks', type: :request do
  let(:confirmed_user) { create(:confirmed_user) }
  let(:user_pending) { create(:user_pending) }
  let(:mainbook_entries) { create(:mainbook_entries) }

  describe 'user pending cannot access mainbook page' do
    before do
      sign_in user_pending
    end

    it 'returns to the index page' do
      get root_path
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'confirmed user gets to access mainbook page' do
    before do
      sign_in confirmed_user
    end

    it 'returns the mainbook entries page' do
      get mainbook_entries_path
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'User gets to create a mainbook entry' do
    before do
      sign_in confirmed_user
      create(:mainbook_entries)
    end

    it 'direct users to main book entry form' do
      get mainbook_new_path
      expect(response).to have_http_status(:ok)
    end
  end
end
