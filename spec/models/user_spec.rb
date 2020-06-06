require 'rails_helper'
require_relative '../juxbar_helper'

begin
  require 'user'
rescue LoadError
end

juxbar_helper = JuxbarHelper.new(
  file_name: "user",
  class_name: "User"
)

RSpec.describe User, unless: juxbar_helper.file_and_class_valid? do
  it '`user.rb` file should exist' do
    expect(juxbar_helper.file_exists?).to be(true)
  end

  it '`User` class should be defined' do
    expect(juxbar_helper.class_defined?).to be(true)
  end
end

RSpec.describe User, type: :model, if: juxbar_helper.file_and_class_valid? do

  subject do
    User.new({ email: "test@test.com", username: "MadzeMed", password: "azerty00" })
  end

  let(:invalid_password) { User.new({ email: "test@test.com", username: "MadzeMad", password: "azerty" }) }
  let(:invalid_username) { User.new({ email: "test@test.com", username: "M4dz€M4d", password: "azerty00" }) }
  let(:invalid_email) { User.new({ email: "test", username: "MadzeMad", password: "azerty00" }) }

  describe "Validations" do
    it { expect(subject).to validate_presence_of(:email)}
    it { expect(subject).to validate_presence_of(:username)}
    it { expect(subject).to validate_confirmation_of(:password) }
    it("is valid with correct attributes") { expect(subject).to be_valid }
    it("is not valid with incorrect password") { expect(invalid_password).to_not be_valid }
    it("is not valid without username") do
      expect(User.new({ email: "test@test.com", password: "azerty00" })).to_not be_valid
    end
    it("is not valid with incorrect username") { expect(invalid_username).to_not be_valid }
    it("is not valid without email") do
      expect(User.new({ username: "MadzeMed", password: "azerty00" })).to_not be_valid
    end
    it("is not valid with incorrect email") { expect(invalid_email).to_not be_valid }
    it("is created") do
      expect{ subject.save }.to change{ User.count }.by(1)
    end
    it { is_expected.to be_an(User) }
  end

  describe "Associations" do
    it { should have_many(:playlists) }
    it { should have_many(:likes).dependent(:destroy) }
    it { should have_many(:bars) }
    it { should validate_confirmation_of(:password) }
  end
end
