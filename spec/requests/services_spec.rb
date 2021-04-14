require 'rails_helper'

RSpec.describe 'Services', type: :request do
  let(:supplier) { create(:supplier) }
  let(:service) { create(:service) }

  before do
    sign_in(supplier)
  end

  describe 'GET /services' do
    it 'works! index path was reached' do
      get supplier_services_path(supplier_id: supplier.id)
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /services#new' do
    it 'works! new path was reached' do
      get new_supplier_service_path(supplier_id: supplier.id)
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /services#edit' do
    it 'works! edit path was reached' do
      get edit_service_path(id: supplier.id, service_id: service.id)
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'PUT /services#update' do
    it 'works! service was updated' do
      put service_path(service), params: { service: { name: 'Beautiful wedding photos', price: 1500, category: 'Photographers', location: 'Cubao' } }
      expect(response).to redirect_to supplier_path(supplier)
    end
  end

  describe 'POST /services#create' do
    it 'works! service was created' do
      post supplier_services_path(service), params: { service: { name: 'Beautiful wedding photos', price: 1500, category: 'Photographers', location: 'Cubao' } }
      expect(response).to redirect_to supplier_path(supplier)
    end
  end

  describe 'DELETE /services#destroy' do
    it 'works! service was deleted' do
      delete service_path(service)
      expect(response).to have_http_status(:no_content)
    end
  end
end
