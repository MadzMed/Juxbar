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

  let(:user) { User.create!(email: "mehdilmbn@gmail.com", password: "juxbar00", username: "MadzMed", barman: true, photo: "https://scontent-cdg2-1.xx.fbcdn.net/v/t1.0-9/s960x960/47689225_10218747533618335_6207042897448009728_o.jpg?_nc_cat=109&_nc_ohc=FoQmIqCNeWMAQlSbe-2QlhWxL1vfCFVZgtr_-pgOUQQYVOlL5zz712xBw&_nc_ht=scontent-cdg2-1.xx&oh=8f14f8adb4b971a8348536fab2536273&oe=5E7F51FA") }
  let(:bar) { Bar.create!(name: "Rockwood", address: "4 Quai Louis XVIII, 33000 Bordeaux", user_id: user.id, description: "Le ROCKWOOD BAR CAFE est le spot parfait pour déguster de délicieux cocktails ou se désaltérer avec l’une de nos 8 bières pressions. Nous proposons également une large sélection de gin, rhum, whisky et spiritueux de qualité.", image: "http://www.rockwood.fr/images/rockwood-bordeaux-happy-hour.jpg") }
  let(:session) { Session.create!({bar_id: bar.id, description: "Le ROCKWOOD BAR CAFE est le spot parfait pour déguster de délicieux cocktails ou se désaltérer avec l’une de nos 8 bières pressions. Nous proposons également une large sélection de gin, rhum, whisky et spiritueux de qualité.", category: "funk" }) }
  context "with render views" do
    describe "#index" do
      it "request list all sessions" do
        get sessions_path, params: {}
        expect(response.status).to eq(200)
        expect(response).to be_successful
        expect(response.body).to include("Rockwood")
      end
    end
    describe "#show" do
      it "request to show" do
        get session_path, params: {id: 2}
        expect(response.status).to eq(200)
        expect(response).to be_successful
        expect(response.body).to include("Le ROCKWOOD BAR CAFE est le spot parfait pour déguster")
      end
    end
  end
end
