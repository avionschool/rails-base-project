require 'rails_helper'

RSpec.describe "Suppliers", type: :request do
  let(:supplier) { create(:supplier) }

  before do
    sign_in(supplier)
  end
 
  describe 'GET /supplier' do
    it '1. gets supplier show path' do
      get supplier_path(supplier)
      expect(response).to render_template(:show)
    end
  end

  
end
