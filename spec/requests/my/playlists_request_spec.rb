require 'rails_helper'
require_relative '../../juxbar_controllers_helper'

begin
  require 'my/playlists_controller'
rescue LoadError
end

FactoryBot.define do
  factory :user do
    email { "test@test.com" }
    username { "JohnDoe" }
    password { "juxbar00" }
  end
end

FactoryBot.define do
  factory :session do
    description { "John doe cafe Lorem ipsum dolor sit amet, consectetur adipisicing elit. Placeat molestiae, recusandae pariatur eveniet natus magni alias! Maiores aspernatur explicabo, quod perferendis! Reprehenderit, dolor ipsa ex aliquid, iusto fuga dicta molestiae." }
    category { "Doe" }
  end
end

juxbar_helper = JuxbarControllersHelper.new(
  file_name: "playlists_controller",
  class_name: "My::PlaylistsController"
)

RSpec.describe "My::Playlists", type: :request do
  describe My::PlaylistsController, type: :request, unless: juxbar_helper.file_and_class_valid? do
    it '`my/playlists_controller.rb` file should exist' do
      expect(juxbar_helper.file_exists?).to be(true)
    end

    it '`My::PlaylistsController` class should be defined' do
      expect(juxbar_helper.class_defined?).to be(true)
    end
  end

  describe My::PlaylistsController, type: :request, if: juxbar_helper.file_and_class_valid? do
    user = FactoryBot.build_stubbed(:user)
    session = FactoryBot.build_stubbed(:session)
    playlist = Playlist.new({session: session, user: user, started_at: Time.now})
    it "create a new playlist and redirect to " do
      sign_in user
      get new_session_my_playlist_path(playlist.session)
      expect(response).to render_template(:new)
      sign out user
    end
  end
end
