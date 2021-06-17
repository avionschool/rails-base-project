require 'rails_helper'

RSpec.describe Role, type: :model do
  it "is not valid without a role name" do
    role = Role.new(role: nil)
    expect(role).to_not be_valid
  end

  it "is not valid if role is empty string" do
    role = Role.new(role: '')
    expect(role).to_not be_valid
  end
  
end
