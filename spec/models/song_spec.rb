require 'rails_helper'
require_relative '../juxbar_helper'

begin
  require 'song'
rescue LoadError
end

juxbar_helper = JuxbarHelper.new(
  file_name: "song",
  class_name: "Song"
)

RSpec.describe Song, unless: juxbar_helper.file_and_class_valid? do
  it '`song.rb` file should exist' do
    expect(juxbar_helper.file_exists?).to be(true)
  end

  it '`Song` class should be defined' do
    expect(juxbar_helper.class_defined?).to be(true)
  end
end

RSpec.describe Song, type: :model, if: juxbar_helper.file_and_class_valid? do
  subject do
    Song.new({artist: "eminem", title: "mockinbird", duration: "180", playlist: Playlist.new })
  end

  describe "Validations" do
    it("is valid with correct attributes") { expect(subject).to be_valid }
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
    it("is created") { expect { subject.save }.to change{ Song.count }.by(1)}
    it { is_expected.to be_an(Song) }
  end

  describe "Associations" do
    it { should belong_to(:playlist) }
    it { should have_many(:likes).dependent(:destroy) }
  end
end
