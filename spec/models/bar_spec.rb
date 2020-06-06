require 'rails_helper'
require_relative '../juxbar_helper'
begin
  require 'bar'
rescue LoadError
end

juxbar_helper = JuxbarHelper.new(
  file_name: "bar",
  class_name: "Bar"
)

RSpec.describe Bar, unless: juxbar_helper.file_and_class_valid? do
  it '`bar.rb` file should exist' do
    expect(juxbar_helper.file_exists?).to be(true)
  end

  it '`Bar` class should be defined' do
    expect(juxbar_helper.class_defined?).to be(true)
  end
end

RSpec.describe Bar, type: :model, if: juxbar_helper.file_and_class_valid? do
  let(:user) { User.new }
  subject do
    Bar.new({user: user, name: "Bar à la Une", description: "célébre bar-restaurant de l'enseigne toulousaines 'à la Une'. découvrez la vaste terrasse ainsi que cette équipe compétente et souriante, prêt à tout pour animer vos soirées"})
  end
  let(:invalid_description) { Bar.new({user: user, name: "bar à mine", description: "slhagzer !!!"})}

  describe "Validations" do
    it("is valid with correct attributes") { expect(subject).to be_valid }
    it "is not valid with incorrect description" do
      expect(invalid_description).to_not be_valid
    end
    it "is not valid without description" do
      expect(Bar.new({ user: user, name: "Bar à la Une" })).to_not be_valid
    end
    it "is not valid without user" do
      expect(Bar.new({ name: "Bar à la Une", description: "célébre bar-restaurant de l'enseigne toulousaines 'à la Une'. découvrez la vaste terrasse ainsi que cette équipe compétente et souriante, prêt à tout pour animer vos soirées" })).to_not be_valid
    end
    it "is not valid without name" do
      expect(Bar.new({ user: user, description: "célébre bar-restaurant de l'enseigne toulousaines 'à la Une'. découvrez la vaste terrasse ainsi que cette équipe compétente et souriante, prêt à tout pour animer vos soirées" })).to_not be_valid
    end
    it("is created") { expect { subject.save }.to change{ Bar.count }.by(1) }
    it { is_expected.to be_an(Bar) }
  end

  describe "Associations" do
    it { should belong_to(:user) }
    it { should have_many(:sessions).dependent(:destroy) }
    it { should validate_length_of(:description).is_at_least(50).is_at_most(260) }
  end
end
