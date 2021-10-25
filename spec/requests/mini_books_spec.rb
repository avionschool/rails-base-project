require 'rails_helper'

RSpec.describe 'MiniBooks', type: :request do
  let(:confirmed_user) { create(:confirmed_user) }
  let(:create_minibook) { create(:create_minibook) }

  describe 'confirmed user gets to access minibooks page' do
    before do
      sign_in confirmed_user
    end

    it 'returns the mainbook entries page' do
      get minibooks_path
      expect(response).to have_http_status(:ok)
    end

    it 'renders the mainbook entries page' do
      get minibooks_path
      expect(response).to render_template('index')
    end
  end

  describe 'User gets to create a new minibook' do
    before do
      sign_in confirmed_user
      create(:create_minibook)
    end

    it 'direct users to new minibook entry form' do
      get minibook_new_path
      expect(response).to have_http_status(:ok)
    end

    it 'renders the form for creating new minibook' do
      get minibook_new_path
      expect(response).to render_template('new')
    end
  end
end
