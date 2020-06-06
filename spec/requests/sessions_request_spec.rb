require 'rails_helper'
require_relative '../juxbar_controllers_helper'

begin
  require 'sessions_controller'
rescue LoadError
end

juxbar_helper = JuxbarControllersHelper.new(
  file_name: "sessions_controller",
  class_name: "SessionsController"
)

RSpec.describe SessionsController, unless: juxbar_helper.file_and_class_valid? do
  it '`sessions_controller.rb` file should exist' do
    expect(juxbar_helper.file_exists?).to be(true)
  end

  it '`SessionsController` class should be defined' do
    expect(juxbar_helper.class_defined?).to be(true)
  end
end

RSpec.describe "Sessions", type: :request, if: juxbar_helper.file_and_class_valid? do

end
