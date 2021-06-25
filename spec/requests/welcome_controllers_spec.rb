require 'rails_helper'

RSpec.describe "WelcomeControllers", type: :request do
  describe "GET /welcome_controllers" do
    it "works! (now write some real specs)" do
      get root_path
      expect(response).to have_http_status(200)
    end
  end
end
