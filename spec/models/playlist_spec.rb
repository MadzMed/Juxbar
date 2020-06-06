require 'rails_helper'

RSpec.describe Playlist, type: :model do
  subject do
    Playlist.new({ user: User.new, session: Session.new, started_at: Time.now })
  end

  describe "with correct attributes" do
    it("is valid with correct attributes") { expect(subject).to be_valid }
    it("is created") { expect{ subject.save }.to change{ Playlist.count }.by(1) }
    it { is_expected.to be_an(Playlist) }
  end

  describe "with incorrect attributes" do
    it("is not valid without user") do
      expect(Playlist.new({ session: Session.new, started_at: Time.now })).to_not be_valid
    end
    it("is not valid without session") do
      expect(Playlist.new({ user: User.new, started_at: Time.now })).to_not be_valid
    end
    it("is not valid without started_at") do
      expect(Playlist.new({ user: User.new, session: Session.new })).to_not be_valid
    end
  end

  describe "Association" do
    it { should belong_to(:user) }
    it { should belong_to(:session) }
    it { should have_many(:songs) }
  end
end
