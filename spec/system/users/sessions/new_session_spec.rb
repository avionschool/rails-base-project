require "rails_helper"

RSpec.describe "Log the user in", type: :system do
  let!(:user) { create :user }
  it "logs user in" do
    visit new_user_session_path
    within "#login_user" do
      fill_in "user_email", with: user.email
      fill_in "user_password", with: user.password
      click_on "Log-in"
    end
    # sleep 2.minutes
    expect(page).to have_current_path new_user_session_path, ignore_query: true
    expect(page).to have_content 'You have to confirm your email address before continuing.'
  end

  it "doesn/'t log the user in" do
    visit new_user_session_path
    within "#login_user" do
      fill_in "user_email", with: user.email
      fill_in "user_password", with: "secret"
      click_on "Log-in"
    end
    expect(page).to have_current_path new_user_session_path, ignore_query: true
    expect(page).to have_content 'Invalid Email or password.'
  end
end
