require 'rails_helper'

RSpec.describe 'MinibookEntries', type: :request do
  let(:confirmed_user) { create(:confirmed_user) }
  let(:minibook_entries) { create(:minibook_entries) }

  describe 'confirmed user gets to access minibook entries page' do
    before do
      sign_in confirmed_user
    end

    it 'returns the minibook entries page' do
      get minibook_entries_path
      expect(response).to have_http_status(:ok)
    end

    it 'renders the minibook entries page' do
      get minibook_entries_path
      expect(response).to render_template('index')
    end

    it 'returns the list of all minibook entries' do
      get all_minibook_entries_path
      expect(response).to have_http_status(:ok)
    end

    it 'renders the page list of all minibook entries' do
      get all_minibook_entries_path
      expect(response).to render_template('all_minibook_entries')
    end
  end

  describe 'User gets to create a minibook entry' do
    before do
      sign_in confirmed_user
      create(:minibook_entries)
    end

    it 'direct users to minibook entry form' do
      get new_minibook_entry_path
      expect(response).to have_http_status(:ok)
    end

    it 'renders minibook entry form' do
      get new_minibook_entry_path
      expect(response).to render_template('new')
    end
  end
end
