require 'rails_helper'
RSpec.describe 'Admins', type: :request do
  let(:admin) { create(:admin) }
  let(:supplier) { create(:supplier) }

  before do
    sign_in(admin)
  end

  describe 'GET /admins' do
    it '1. gets admin index path' do
      get admins_path
      expect(response).to render_template(:index)
    end
  end

  describe 'GET /admins/pending/supplier' do
    it '1. gets admin pending supplier path' do
      get pending_supplier_signup_admin_path
      expect(response).to render_template(:pending_supplier_signup)
    end
  end

  describe 'PUT /admins/:id/approve_supplier' do
    it '1. gets admin approve supplier signup ' do
      put approve_supplier_admin_path(supplier)
      expect(response).to redirect_to admins_path
    end
  end
end
