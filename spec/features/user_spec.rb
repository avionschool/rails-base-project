require 'rails_helper'

RSpec.feature "Authenticates", type: :feature do
  describe "Register a user" do
    it 'Successfull registration' do
      visit new_user_registration_path
      fill_in 'first_name', with: 'Sample First Name'
      fill_in 'last_name', with: 'Sample Last Name'
      fill_in 'email_address', with: 'Sample Email'
      fill_in 'password', with: 'Sample Password'
      fill_in 'confirm_password', with: 'Sample Password'

      click_on 'Sign Up'

      expect(page).to have_content("Confirmation link has been send to your email. Kindly open to activate your account.")
    end     


    describe "Login user" do
      it 'Redirect to index when valid' do
        visit new_user_session_path
        fill_in 'email_address', with: 'Sample Email'
        fill_in 'password', with: 'Sample Password'
  
        click_on 'Log In'
  
        expect(page).to have_current_path(new_user_session_path)
      end   

      it 'Error message will appear if email is not valid' do
        visit new_user_session_path
        fill_in 'email_address', with: nil
        fill_in 'password', with: 'Sample Password'
  
        click_on 'Log In'
  
        expect(page).to have_content("Invalid email.")
      end  
      
      
      it 'Error message will appear if password is not valid' do
        visit new_user_session_path
        fill_in 'email_address', with: 'Sample Email'
        fill_in 'password', with: nil
  
        click_on 'Log In'
  
        expect(page).to have_content("Invalid password.")
      end  
    end
  end
end
