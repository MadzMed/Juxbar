require 'rails_helper'
require_relative '../juxbar_helper'

begin
  require 'playlist'
rescue LoadError
end

juxbar_helper = JuxbarHelper.new(
  file_name: "playlist",
  class_name: "Playlist"
)

RSpec.describe Playlist, unless: juxbar_helper.file_and_class_valid? do
  it '`playlist.rb` file should exist' do
    expect(juxbar_helper.file_exists?).to be(true)
  end

  it '`Playlist` class should be defined' do
    expect(juxbar_helper.class_defined?).to be(true)
  end
end

RSpec.describe Playlist, type: :model, if: juxbar_helper.file_and_class_valid? do
  subject do
    Playlist.new({ user: User.new, session: Session.new, started_at: Time.now })
  end

  describe "Validations" do
    it("is valid with correct attributes") { expect(subject).to be_valid }
    it("is not valid without user") do
      expect(Playlist.new({ session: Session.new, started_at: Time.now })).to_not be_valid
    end
    it("is not valid without session") do
      expect(Playlist.new({ user: User.new, started_at: Time.now })).to_not be_valid
    end
    it("is not valid without started_at") do
      expect(Playlist.new({ user: User.new, session: Session.new })).to_not be_valid
    end
    it("is created") { expect{ subject.save }.to change{ Playlist.count }.by(1) }
    it { is_expected.to be_an(Playlist) }
  end

  describe "Associations" do
    it { should belong_to(:user) }
    it { should belong_to(:session) }
    it { should have_many(:songs) }
  end
end
