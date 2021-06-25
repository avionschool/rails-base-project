require 'rails_helper'

RSpec.describe "BuyerStocksControllers", type: :request do
  describe "GET /buyer_stocks" do
    it "should get index" do
      get buyer_stocks_path
      expect(response).to have_http_status(200)
    end
  end
end
