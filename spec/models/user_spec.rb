require 'rails_helper'

RSpec.describe User, type: :model do

  subject do
    User.new({ email: "test@test.com", username: "MadzeMed", password: "azerty00" })
  end

  let(:invalid_password) { User.new({ email: "test@test.com", username: "MadzeMad", password: "azerty" }) }
  let(:invalid_username) { User.new({ email: "test@test.com", username: "M4dz€M4d", password: "azerty00" }) }
  let(:invalid_email) { User.new({ email: "test", username: "MadzeMad", password: "azerty00" }) }

  describe "ActiveRecord validation" do
    describe "with correct attributes" do
      it { expect(subject).to validate_presence_of(:email)}
      it("is valid with correct attributes") { expect(subject).to be_valid }
      it("is created") do
        expect{ subject.save }.to change{ User.count }.by(1)
      end
      it { is_expected.to be_an(User) }
      it { expect(subject).to validate_confirmation_of(:password) }
    end

    describe "with incorrect attributes" do
      it("is not valid with incorrect password") { expect(invalid_password).to_not be_valid }
      it("is not valid without username") do
        expect(User.new({ email: "test@test.com", password: "azerty00" })).to_not be_valid
      end
      it("is not valid with incorrect username") { expect(invalid_username).to_not be_valid }
      it("is not valid without email") do
        expect(User.new({ username: "MadzeMed", password: "azerty00" })).to_not be_valid
      end
      it("is not valid with incorrect email") { expect(invalid_email).to_not be_valid }
    end
  end

  describe "Association" do
    it { should have_many(:playlists) }
    it { should have_many(:likes).dependent(:destroy) }
    it { should have_many(:bars) }
    it { should validate_confirmation_of(:password) }
  end
end
