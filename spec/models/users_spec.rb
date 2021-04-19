require "rails_helper"

RSpec.describe User, type: :model do
  describe "validations" do
    # Email Validations
    it { expect(described_class.new).to validate_presence_of :email }

    before :each do
       User.create(email: "test@gmail.com", password: "123456") 
       Role.create(name: "Buyer") 
    end
    it { should validate_uniqueness_of(:email).case_insensitive }

    it { should allow_value("email@address.com").for(:email) }
    it { should allow_value("email@address").for(:email) }
    it { should_not allow_value("email@.com").for(:email) }
    it { should_not allow_value("email@addrs.").for(:email) }

    context "when the email is taken" do
      it "should not save the duplicate" do
        user1 = FactoryBot.build(:user)
        user2 = FactoryBot.build(:user)
        user1.save
        expect(user2.save).to be_falsy
      end
    end
    # Password Validation
    it { expect(described_class.new).to validate_presence_of :encrypted_password }
  end

  describe "instance methods" do
    before :each do
      Stock.create(name: "TEST STOCK", code: "TEST", volume: 0)
      Role.create(name: "Buyer")
      User.create(email: "buyer@gmail.com", password: "123456", role_id: Role.find_by_name("Buyer").id)
      User.create(email: "seller@gmail.com", password: "123456", role_id: Role.find_by_name("Buyer").id)
      User.find_by_email('buyer@gmail.com').update(cash: 5000)
      User.find_by_email('seller@gmail.com').update(cash: 5000)
    end
    #describe buy_stock
    it "buy_stock should buy stock properly" do
      expect(User.find_by_email('buyer@gmail.com').buy_stock("TEST", 10, 1)).to be true
      byebug
    end
    it "buy_stock should not buy stock when not enough cash" do
      expect(User.find_by_email('buyer@gmail.com').buy_stock("TEST", 1000, 45)).to be false
    end
    #describe sell_stock
    #describe process_transaction
  end
end
