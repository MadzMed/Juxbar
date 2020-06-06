require 'rails_helper'
require_relative '../../juxbar_controllers_helper'

begin
  require 'my/playlists_controller'
rescue LoadError
end

juxbar_helper = JuxbarControllersHelper.new(
  file_name: "playlists_controller",
  class_name: "My::PlaylistsController"
)

RSpec.describe PlaylistsController, unless: juxbar_helper.file_and_class_valid? do
  it '`my/playlists_controller.rb` file should exist' do
    expect(juxbar_helper.file_exists?).to be(true)
  end

  it '`My::PlaylistsController` class should be defined' do
    expect(juxbar_helper.class_defined?).to be(true)
  end
end

RSpec.describe "PlaylistsController", type: :request, if: juxbar_helper.file_and_class_valid? do
  # it "render index of playlist page" do
  #   expect(response).to render_template(:index)
  # end
end

RSpec.describe "My::Playlists", type: :request do

end
