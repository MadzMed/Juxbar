require 'rails_helper'

RSpec.describe Bar, type: :model do

  let(:invalid_bar) { Bar.new({name: "bar à mine", description: "slhagzer !!!"})}
  it { is_expected.to be_an(Bar) }
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
  it "is valid with valid attributes" do
    expect(invalid_bar).to_not be_valid
  end
end
