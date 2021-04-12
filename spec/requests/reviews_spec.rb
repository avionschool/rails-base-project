require 'rails_helper'

RSpec.describe 'Reviews', type: :request do
  let(:buyer) { create(:buyer) }
  let(:supplier) { create(:supplier) }
  let(:service) { create(:service) }
  let(:review) { create(:review) }

  before do
    sign_in(buyer)
  end

  describe 'GET /reviews' do
    it 'works! index path was reached' do
      get service_reviews_path(service_id: service.id)
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /reviews#show' do
    it 'works! show path was reached' do
      get review_path(review)
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /reviews#edit' do
    it 'works! edit path was reached' do
      get edit_review_path(review)
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'PUT /reviews#update' do
    it 'works! review was updated' do
      put review_path(review), params: { review: { title: 'Yey!', body: 'Testing complete?', rating: 3 } }
      expect(response).to redirect_to service_reviews_path(service_id: review.service_id)
    end
  end

  describe 'POST /reviews#create' do
    it 'works! review was created' do
      post service_reviews_path(review), params: { review: { title: 'Yey!', body: 'Testing complete?', rating: 3 } }
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'DELETE /reviews#destroy' do
    it 'works! review was deleted' do
      delete review_path(review)
      expect(response).to have_http_status(:no_content)
    end
  end
end
