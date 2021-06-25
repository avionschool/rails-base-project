require 'rails_helper'

RSpec.feature "Users", type: :feature do
  describe 'registration process buyer' do
    before { visit root_path }
    it 'succesfully creates a buyer account' do
      within 'body' do
        expect(page).to have_content 'Login'
        expect(page).to have_content 'Sign Up'
        click_on 'Sign Up'
      end

      expect(page).to have_current_path new_user_path
      within 'body' do
        expect(page).to have_content 'Username'
        expect(page).to have_content 'Password'
        expect(page).to have_content 'Email'
        expect(page).to have_content 'Role'
        expect(page).to have_content 'Broker'
        expect(page).to have_content 'Buyer'
      end

      within 'form' do
        fill_in 'user_username',	with: 'sampleusername'
        fill_in 'user_email',	with: 'sampleemail@gmail.com'
        fill_in 'user_password',	with: 'samplepassword'
        select 'Buyer', :from => 'user_role' 
        click_on 'Register'
      end

      expect(page).to have_current_path dashboard_buyer_path
    end 
  end

  describe 'registration process broker' do
    before { visit root_path }
    it 'succesfully creates a broker account' do
      within 'body' do
        expect(page).to have_content 'Login'
        expect(page).to have_content 'Sign Up'
        click_on 'Sign Up'
      end

      expect(page).to have_current_path new_user_path
      within 'body' do
        expect(page).to have_content 'Username'
        expect(page).to have_content 'Password'
        expect(page).to have_content 'Email'
        expect(page).to have_content 'Role'
        expect(page).to have_content 'Broker'
        expect(page).to have_content 'Buyer'
      end

      within 'form' do
        fill_in 'user_username',	with: 'sampleusername'
        fill_in 'user_email',	with: 'sampleemail@gmail.com'
        fill_in 'user_password',	with: 'samplepassword'
        select 'Broker', :from => 'user_role' 
        click_on 'Register'
      end

      expect(page).to have_current_path root_path
    end 
  end

  describe 'login process buyer / admin' do
    before do
      @user = User.create(username:'sample', email:'sample@gmail.com', password:'sample', role:'buyer', status:'approved', money:0)
      visit login_path
    end 

    it 'succesfully logs into a buyer account' do
      within 'body' do
        expect(page).to have_content 'Username'
        expect(page).to have_content 'Password'
      end

      within 'form' do
        fill_in 'username',	with: @user.username
        fill_in 'password',	with: @user.password
        click_on 'Login'
      end

      expect(page).to have_current_path dashboard_buyer_path
    end 
  end

  describe "login process broker with approved status" do
    before do
      @user = User.create(username:'sample', email:'sample@gmail.com', password:'sample', role:'broker', status:'approved', money:0)
      visit login_path
    end 

    it 'succesfully logs into a buyer account' do
      within 'body' do
        expect(page).to have_content 'Username'
        expect(page).to have_content 'Password'
      end

      within 'form' do
        fill_in 'username',	with: @user.username
        fill_in 'password',	with: @user.password
        click_on 'Login'
      end

      expect(page).to have_current_path dashboard_broker_path
    end 
  end

  describe 'login process broker with pending status' do
    before do
      @user = User.create(username:'sample', email:'sample@gmail.com', password:'sample', role:'broker', status:'pending', money:0)
      visit login_path
    end 

    it 'succesfully logs into a buyer account' do
      within 'body' do
        expect(page).to have_content 'Username'
        expect(page).to have_content 'Password'
      end

      within 'form' do
        fill_in 'username',	with: @user.username
        fill_in 'password',	with: @user.password
        click_on 'Login'
      end

      expect(page).to have_current_path current_path
    end 
  end

  describe 'logout process (applicable to admin, broker and buyer)' do
    before do
      @user = User.create(username:'sample', email:'sample@gmail.com', password:'sample', role:'buyer', status:'approved', money:0)
      visit login_path
    end 

    it "succesfully logs out from a buyer account" do
      within 'body' do
        expect(page).to have_content 'Username'
        expect(page).to have_content 'Password'
      end

      within 'form' do
        fill_in 'username',	with: @user.username
        fill_in 'password',	with: @user.password
        click_on 'Login'
      end

      expect(page).to have_current_path dashboard_buyer_path
      within 'body' do
        expect(page).to have_content 'Logout'
        click_on 'Logout'
      end

      expect(page).to have_current_path root_path
    end 
  end
end 