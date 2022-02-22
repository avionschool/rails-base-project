require 'rails_helper'

RSpec.describe User, type: :model do
    let!(:user) { User.new }
    it "should have a valid email" do
        user.email = 'invalidemail'
        user.password = 'password'

        expect(user).to_not be_valid
        user.email = "user@example.com"
        expect(user).to be_valid
    end

    it "should have a password" do
        user.email = 'user@example.com'
        user.password = nil

        expect(user).to_not be_valid
        user.password = 'password'
        expect(user).to be_valid
    end

    it "should have a default approved of false" do
        user.email = 'user@example.com'
        user.password = 'password'

        expect(user.approved).to eq(false)
    end
end