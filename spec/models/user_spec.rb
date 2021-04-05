require 'rails_helper'

RSpec.describe User, type: :model do 
  subject {
    described_class.new(
      first_name: "first",
      last_name: "last",
      email: "name@example.com",
      dob: Date.today,
      password: "password")
  }

  describe "Validations" do
    it "creates a new User instance" do
      expect(subject).to be_an_instance_of User
    end

    it "saves the user to the database" do
      starting_database_count = User.count
      subject.save
      expect(User.count).to eq (starting_database_count + 1)
    end

    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without a first_name" do
      subject.first_name = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a email" do
      subject.email = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a password" do
      subject.password = nil
      expect(subject).to_not be_valid
    end

    it "should have password of length mre than 3 and less than 20" do
     should validate_length_of(subject.password).is_at_least(3).is_at_most(20)
    end
  end

  describe "Associations" do
    it { should have_many(:addresses) }
  end
end
