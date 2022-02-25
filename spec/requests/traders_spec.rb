require 'rails_helper'

RSpec.describe 'Traders', type: :request do
    let(:trader) { create(:trader) }


    describe 'User sign in and log out' do
        it 'returns the index page' do
            get root_path
            expect(response).to have_http_status(302)
        end

        it 'signs trader in' do
            sign_in trader
            get trader_portfolio_path
            expect(response).to be_successful
        end
    end

end