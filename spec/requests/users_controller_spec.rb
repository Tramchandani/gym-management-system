require 'rails_helper'

RSpec.describe "UsersControllers", type: :request do
  describe "GET /new" do
    it "renders new template" do
      get new_user_path
      expect(response).to render_template("new")
    end
  end
end
