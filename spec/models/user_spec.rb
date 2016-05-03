require 'rails_helper'

RSpec.describe User, type: :model do
  let(:two) { FactoryGirl.create(:user) }

  it "is a User" do
    one = User.new(email: "abc@omega.com", password: "password")

    expect(one).to be_a(User)
  end

  it "has an address" do
    expect(two.address).to be_a String
  end

  it "has an email" do
    expect(two.email).to be_a String
  end
end
