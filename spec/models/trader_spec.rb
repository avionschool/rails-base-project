require 'rails_helper'

RSpec.describe Trader, type: :model do
    context 'when trader sign_up check validations' do
        it 'should not save w/o  username' do
            trader = described_class.new(username: nil, fullname: 'Raon Lee', email: 'lee@raon@email.com', password: 'sample_password')
            expect(trader).not_to be_valid
        end

        it 'should not save w/o  fullname' do
            trader = described_class.new(username: 'raonLee', fullname: nil, email: 'lee@raon@email.com', password: 'sample_password')
            expect(trader).not_to be_valid
        end

        it 'should not save w/o  email' do
            trader = described_class.new(username: 'raonLee', fullname: 'Raon Lee', email: nil, password: 'sample_password')
            expect(trader).not_to be_valid
        end

        it 'should not save w/o  password' do
            trader = described_class.new(username: 'raonLee', fullname: 'Raon Lee', email: 'lee@raon@email.com', password: nil)
            expect(trader).not_to be_valid
        end
    end
end