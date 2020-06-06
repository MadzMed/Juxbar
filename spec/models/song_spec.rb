require 'rails_helper'

RSpec.describe Song, type: :model do
  subject do
    Song.new({artist: "eminem", title: "mockinbird", duration: "180", playlist: Playlist.new })
  end
  let(:invalid_song) { Song.new }

  describe "with correct attributes" do
    it("is valid with correct attributes") { expect(subject).to be_valid }
    it("is created") { expect { subject.save }.to change{ Song.count }.by(1)}
    it { is_expected.to be_an(Song) }
  end

  describe "with incorrect attributes" do
    it("is not valid without a playlist_id") do
      expect(Song.new({ artist: "eminem", title: "mockinbird", duration: "180" })).to_not be_valid
    end
    it("is not valid without duration") do
      expect(Song.new({ artist: "eminem", title: "mockinbird", playlist: Playlist.new })).to_not be_valid
    end
    it("is not valid without title") do
      expect(Song.new({ artist: "eminem", duration: "180", playlist: Playlist.new })).to_not be_valid
    end
    it("is not valid without artist") do
      expect(Song.new({ title: "mockinbird", duration: "180", playlist: Playlist.new })).to_not be_valid
    end
  end
end
