require 'rails_helper'

RSpec.describe 'MainBooks', type: :request do
  let(:confirmed_user) { create(:confirmed_user) }
  let(:mainbook_entries) { create(:mainbook_entries) }

  describe 'confirmed user gets to access mainbook page' do
    before do
      sign_in confirmed_user
    end

    it 'returns the mainbook entries page' do
      get mainbook_entries_path
      expect(response).to have_http_status(:ok)
    end

    it 'renders the mainbook entries page' do
      get mainbook_entries_path
      expect(response).to render_template('mainbook_entries')
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

    it 'renders main book entry form' do
      get mainbook_new_path
      expect(response).to render_template('new')
    end
  end
end
