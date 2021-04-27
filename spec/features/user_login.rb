require 'rails_helper'


RSpec.describe 'Login as a User', type: :feature do
    let(:buyer) {create :user, :buyer}
    let(:broker) {create :user, :broker}

    it 'signs the buyer user in' do
      visit new_user_session_path

      within "#new_user" do 
      fill_in 'user_email', with: buyer.email
      fill_in 'user_password', with: buyer.password

      click_on('Log in')
      expect(page).to have_current_path(buyers_path)

      end
    
    end


    it 'signs the broker user in' do
      visit new_user_session_path

      within "#new_user" do 
      fill_in 'user_email', with: broker.email
      fill_in 'user_password', with: broker.password

      click_on('Log in')
      expect(page).to have_current_path(brokers_path)

      end
    
    end
end