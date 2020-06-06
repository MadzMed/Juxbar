require 'rails_helper'
require_relative '../juxbar_controllers_helper'

begin
  require 'playlists_controller'
rescue LoadError
end

juxbar_helper = JuxbarControllersHelper.new(
  file_name: "playlists_controller",
  class_name: "PlaylistsController"
)

RSpec.describe PlaylistsController, type: :request, unless: juxbar_helper.file_and_class_valid? do
  it '`playlists_controller.rb` file should exist' do
    expect(juxbar_helper.file_exists?).to be(true)
  end

  it '`PlaylistsController` class should be defined' do
    expect(juxbar_helper.class_defined?).to be(true)
  end
end

RSpec.describe "PlaylistsController", type: :request, if: juxbar_helper.file_and_class_valid? do
  # it "render index of playlist page" do
  #   expect(response).to render_template(:index)
  # end
end
