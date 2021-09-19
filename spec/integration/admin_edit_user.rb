require 'rails_helper'

RSpec.describe "Admins", type: :request do
  before(:each) do
    @trader = User.create(email: "test_user@test.com", password: "test12345", full_name: "test_user", username: "test_user" )
  end
  describe "edit user" do
    let(:valid_params) do { user: {email: "edit@test.com", full_name: "test_user edit", username: "test_user edit"} } end
    #edit user
    it "edits a user" do
      patch user_profile_path(@trader.id), params: valid_params
      expect(response).to have_http_status :redirect
    end
  end
end