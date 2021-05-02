require 'rails_helper'

RSpec.describe 'Log the user in', type: :feature do
  before do
    Role.create(name: 'Buyer')
    Role.create(name: 'Admin')
    Role.create(name: 'Broker')
  end

  let!(:user) { create :user }

  it 'logs user in' do
    visit new_user_session_path
    within '#login_user' do
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: user.password
      click_on 'Log-in'
    end
    expect(page).to have_current_path dashboard_path, ignore_query: true
  end

  it 'flashes success message' do
    visit new_user_session_path
    within '#login_user' do
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: user.password
      click_on 'Log-in'
    end
    expect(page).to have_content 'Signed in successfully.'
  end

  it "doesn/'t log the user in" do
    visit new_user_session_path
    within '#login_user' do
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: 'secret'
      click_on 'Log-in'
    end
    expect(page).to have_current_path new_user_session_path, ignore_query: true
  end

  it 'flashes failed message' do
    visit new_user_session_path
    within '#login_user' do
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: 'secret'
      click_on 'Log-in'
    end
    expect(page).to have_content 'Invalid Email or password.'
  end
end
