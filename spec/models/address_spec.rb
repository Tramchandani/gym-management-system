require 'rails_helper'

RSpec.describe Address, type: :model do

  before do
    @user = User.create(id: 1,
      first_name: "first",
      last_name: "last",
      email: "name@example.com",
      dob: Date.today,
      password: "password")

    @address = @user.addresses.create(id: 1,
      house_number: 1,
      colony: "colony",
      street: "street",
      city: "city",
      state: "state")
  end

  describe "Validations" do
    it "is valid with valid attributes" do
      expect(@user).to be_valid
    end
  end
 
  describe "Associations" do
    it { should belong_to(:user).class_name('User') }
  end
end
