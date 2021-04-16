require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    # Email Validations
    it { expect(described_class.new).to validate_presence_of :email }

    before { User.create(email: "test@gmail.com",password: "123456")}
    it { should validate_uniqueness_of(:email).case_insensitive}

    it { should allow_value("email@address.com").for(:email)} 
    it { should allow_value("email@address").for(:email)} 
    it { should_not allow_value("email@.com").for(:email)} 
    it { should_not allow_value("email@addrs.").for(:email)} 

    context "when the email is taken" do
        it "should not save the duplicate" do
            user1 =  FactoryBot.build(:user)
            user2 =  FactoryBot.build(:user)
            user1.save
            expect(user2.save).to be_falsy
        end
    end
    # Password Validation
    it { expect(described_class.new).to validate_presence_of :encrypted_password }

  
  end
  

end