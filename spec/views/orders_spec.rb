require 'rails_helper'

RSpec.describe "Orders", type: :feature do
  describe "on visit" do
    before {visit trade_path("BTC")}

    it "shows sign up and sign in on navbar on visit without credentials" do
      expect(page).to have_content("Sign up")
      expect(page).to have_content("Sign in")
    end

    it "signs in right after signing up" do
      click_link('Sign up')
      fill_in "user[email]", with: "new69@new.com"
      fill_in "user[password]", with: "123456"
      fill_in "user[password_confirmation]", with: "123456"

      select "User", :from => "user[kind]"
      click_button('Sign up')

      expect(page).to have_content("Wallet")
      expect(page).to_not have_content("Administrator controls")
    end

    it "signs out properly" do
      click_link('Sign Out')
    end
  end
end