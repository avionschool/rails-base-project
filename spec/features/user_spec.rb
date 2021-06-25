require 'rails_helper'

RSpec.feature 'Authenticates', type: :feature do
  let(:broker) { create :broker }

  it 'logs the broker user in' do
    visit new_broker_session_path

      fill_in 'user_email', with: broker.email
      fill_in 'user_password', with: broker.password

      click_on('Log in')
 
    expect(page).to have_current_path (brokers_path)
  end
  
  
  describe 'Register a user' do
    it 'Successfull registration' do
      visit new_buyer_registration_path

      fill_in 'password', with: 'Sample Password'
      fill_in 'password_confirmation', with: 'Sample Password'
      click_on 'Sign Up'
      expect(page).to have_current_path(buyer_path)
    end

    describe 'Login user' do
      it 'Redirect to index when valid' do
        visit new_buyer_session_path
        fill_in 'email', with: 'Sample Email'
        fill_in 'password', with: 'Sample Password'
        click_on 'Log In'
        expect(page).to have_current_path(buyer_path)
      end

      it 'Error message will appear if email is not valid' do
        visit new_buyer_session_path
        fill_in 'email', with: nil
        fill_in 'password', with: 'Sample Password'
        click_on 'Log In'
        expect(page).to have_content('Invalid email or password')
      end
      
      it 'Error message will appear if password is not valid' do
        visit new_buyer_session_path
        fill_in 'email', with: 'Sample Email'
        fill_in 'password', with: nil
        click_on 'Log In'
        expect(page).to have_content('Invalid email or password')
      end
    end
  end
end


  describe 'Register a user' do
    it 'Register' do
      visit new_buyer_registration_path
      page.all(:fillable_field, 'sample')
      fill_in 'email', with: 'Sample@email.com'
      fill_in 'password', with: 'Password'
      fill_in 'confirm_password', with: 'Password'
      click_on 'Sign Up'
      expect(page).to have_current_path(buyer_path)    
    end
  end

  describe 'Login user' do
    it 'Redirect to broker index when valid' do
      visit new_broker_session_path
      fill_in 'email', with: 'Sample Email'
      fill_in 'password', with: 'Sample Password'
      click_on 'Log In'
      expect(page).to have_current_path(broker_path)
    end

    it 'Error message will appear if email is not valid' do
      visit new_broker_session_path
      fill_in 'email', with: nil
      fill_in 'password', with: 'Sample Password'
      click_on 'Log In'
      expect(page).to have_content('Invalid email or password')
    end

    it 'Error message will appear if password is not valid' do
      visit new_broker_session_path
      fill_in 'email', with: 'Sample Email'
      fill_in 'password', with: nil
      click_on 'Log In'
      expect(page).to have_content('Invalid email or password')
    end
 end
