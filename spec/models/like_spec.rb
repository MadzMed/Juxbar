require 'rails_helper'

RSpec.describe Like, type: :model do
  subject do
    Like.new({song: Song.new, user: User.new})
  end

  describe "with correct attributes" do
    it("is valid with correct attributes") { expect(subject).to be_valid }
    it("is created") { expect { subject.save }.to change{ Like.count }.by(1)}
    it { is_expected.to be_an(Like) }
  end

  describe "with incorrect attributes" do
    it("is not valid without a song") do
      expect(Like.new({user: User.new})).to_not be_valid
    end
    it("is not valid without an user") do
      expect(Like.new({song: Song.new})).to_not be_valid
    end
  end

  describe "Association" do
    it { should belong_to(:user) }
    it { should belong_to(:song) }
  end
end
