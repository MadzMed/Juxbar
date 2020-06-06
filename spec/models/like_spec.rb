require 'rails_helper'
require_relative '../juxbar_helper'

begin
  require 'like'
rescue LoadError
end

juxbar_helper = JuxbarHelper.new(
  file_name: "like",
  class_name: "Like"
)

RSpec.describe Like, unless: juxbar_helper.file_and_class_valid? do
  it '`like.rb` file should exist' do
    expect(juxbar_helper.file_exists?).to be(true)
  end

  it '`Like` class should be defined' do
    expect(juxbar_helper.class_defined?).to be(true)
  end
end

RSpec.describe Like, type: :model, if: juxbar_helper.file_and_class_valid? do
  subject do
    Like.new({song: Song.new, user: User.new})
  end

  describe "Validations" do
    it("is valid with correct attributes") { expect(subject).to be_valid }
    it("is not valid without a song") do
      expect(Like.new({user: User.new})).to_not be_valid
    end
    it("is not valid without an user") do
      expect(Like.new({song: Song.new})).to_not be_valid
    end
    it("is created") { expect { subject.save }.to change{ Like.count }.by(1)}
    it { is_expected.to be_an(Like) }
  end

  describe "Associations" do
    it { should belong_to(:user) }
    it { should belong_to(:song) }
  end
end
