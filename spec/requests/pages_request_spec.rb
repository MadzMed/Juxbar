require 'rails_helper'

RSpec.describe "PagesController", type: :request do
  it "render home page" do
    expect(response).to render_template(:home)
  end
end
