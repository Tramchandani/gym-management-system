require 'rails_helper'

RSpec.describe "UsersControllers", type: :request do

  before do
    user = create(:user)
    login_as user
  end

  describe "GET /new" do
    it "renders new template" do
      get new_user_registration_path
      expect(response).to render_template("new")
    end
  end

  describe "GET /show" do
    it "renders show template" do
      get user_path(@user.id)
      expect(response).to render_template("show")
    end
  end
end
