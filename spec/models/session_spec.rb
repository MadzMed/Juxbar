require 'rails_helper'
require_relative '../juxbar_helper'

begin
  require 'session'
rescue LoadError
end

juxbar_helper = JuxbarHelper.new(
  file_name: "session",
  class_name: "Session"
)

RSpec.describe Session, unless: juxbar_helper.file_and_class_valid? do
  it '`session.rb` file should exist' do
    expect(juxbar_helper.file_exists?).to be(true)
  end

  it '`Session` class should be defined' do
    expect(juxbar_helper.class_defined?).to be(true)
  end
end

RSpec.describe Session, type: :model, if: juxbar_helper.file_and_class_valid? do
  subject do
    Session.new({bar: Bar.new, description: "session funk dans les locaux de tel bar, assister nombreux à notre DJ mix, Happy Hour jusqu'à 21h !!!!!", category: "funk"})
  end

  describe "Validations" do
    it("is valid with correct attributes") { expect(subject).to be_valid }
    it("is not valid without description") do
      expect(Session.new({ bar: Bar.new, category: "funk"})).to_not be_valid
    end
    it("is not valid with incorrect description") do
      expect(Session.new({ bar: Bar.new, category: "funk", description: "hello world"})).to_not be_valid
    end
    it("is not valid without bar") do
      expect(Session.new({ description: "session funk dans les locaux de tel bar, assister nombreux à notre DJ mix, Happy Hour jusqu'à 21h !!!!!", category: "funk"}))
    end
    it("is not valid without a category") do
      Session.new({ bar: Bar.new, description: "session funk dans les locaux de tel bar, assister nombreux à notre DJ mix, Happy Hour jusqu'à 21h !!!!!"})
    end
    it("is created") { expect { subject.save }.to change { Session.count }.by(1) }
    it { is_expected.to be_an(Session) }
  end

  describe "Associations" do
    it { should belong_to(:bar) }
    it { should have_many(:playlists) }
    it { should validate_length_of(:description).is_at_least(50).is_at_most(260) }
  end
end
