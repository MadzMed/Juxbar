require 'rails_helper'

RSpec.describe Session, type: :model do
  subject do
    Session.new({bar: Bar.new, description: "session funk dans les locaux de tel bar, assister nombreux à notre DJ mix, Happy Hour jusqu'à 21h !!!!!", category: "funk"})
  end

  describe "with correct attributes" do
    it("is valid with correct attributes") { expect(subject).to be_valid }
    it("is created") { expect { subject.save }.to change { Session.count }.by(1) }
    it { is_expected.to be_an(Session) }
  end

  describe "with incorrect attributes" do
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
  end
end
