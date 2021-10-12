require 'rails_helper'

RSpec.describe 'ReviewCenters', type: :request do
  let(:rc) { build(:review_center) }

  describe 'session' do
    it 'gets /review_center/sign_in' do
      get new_review_center_session_path
      expect(response).to have_http_status(:ok)
    end

    it 'renders new template if creation fails' do
      post review_center_session_path, params: { review_center: { email: '', password: rc.password } }
      expect(response).to render_template(:new)
    end
  end

  describe 'registration' do
    it 'gets /review_center/sign_up' do
      get new_review_center_registration_path
      expect(response).to have_http_status(:ok)
    end

    it 'creates a review center' do
      expect { post review_center_registration_path, params: { review_center: { name: rc.name, email: rc.email, password: rc.password } } }.to change(ReviewCenter, :count).by(1)
    end

    it 'redirects to review center home path after registration' do
      post review_center_registration_path, params: { review_center: { name: rc.name, email: rc.email, password: rc.password } }
      expect(response).to redirect_to(authenticated_rc_root_path)
    end

    it 'renders new template if creation fails' do
      post review_center_registration_path, params: { review_center: { name: '', email: rc.email, password: rc.password } }
      expect(response).to render_template(:new)
    end
  end
end
