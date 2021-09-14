require 'rails_helper'

  it "is valid with valid attributes" do
    user1 = User.new(email: 'email@example.com', password: 'password')
    expect(user1).to be_valid
  end

  it "is not valid without first_name" do
    user2 = User.new(first_name: nil)
    expect(user2).to_not be_valid
  end

  it "is not valid without last_name" do
    user2 = User.new(last_name: nil)
    expect(user2).to_not be_valid
  end

  it "is not valid without email" do
    user2 = User.new(email: nil)
    expect(user2).to_not be_valid
  end

  it "is not valid without username" do
    user2 = User.new(username: nil)
    expect(user2).to_not be_valid
  end

end