require 'rails_helper'

RSpec.describe "Devise", type: :feature do

  def seed_users
    User.create([
      {email: 'cc@avion.com', password: 'kristocurrency', admin: true},
      {email: 'new1@avion.com', password: 'qwerty', admin: false}
    ])
  end

  def sign_up
    click_link('Sign Up')
    fill_in "user[email]", with: "new69@new.com"
    fill_in "user[password]", with: "123456"
    fill_in "user[password_confirmation]", with: "123456"

    select "User", :from => "user[kind]"
    click_button('Sign up')
  end

  def admin_log_in
    click_link('Sign in')
    fill_in "user[email]", with: "cc@avion.com"
    fill_in "user[password]", with: "kristocurrency"

    click_button('Log in')
  end

  describe "on visit" do
    before {seed_users}
    before {visit root_path}

    it "shows sign up and sign in on navbar without credentials" do
      expect(page).to have_content("Sign Up")
      expect(page).to have_content("Sign In")
    end

    it "fails on signing up with mismatched passwords" do
      click_link('Sign Up')
      fill_in "user[email]", with: "new69@new.com"
      fill_in "user[password]", with: "123456"
      fill_in "user[password_confirmation]", with: "6543221"

      select "User", :from => "user[kind]"
      click_button('Sign up')

      expect(page).to have_content("prohibited this user")
    end

    it "signs in right after signing up" do
      sign_up

      expect(page).to have_content("Wallet")
      expect(page).to_not have_content("Administrator controls")
    end

    it "signs out properly" do
      sign_up
      click_link('Sign Out')

      expect(page).to have_content("Signed out")
    end

    it "knows when an admin is logged in" do
      admin_log_in
      
      expect(page).to have_content("Administrator controls")
    end

  end
end