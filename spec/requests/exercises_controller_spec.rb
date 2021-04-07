require 'rails_helper'

RSpec.describe "ExercisesControllers", type: :request do

  before do
    user = create(:user)
    login_as user
    @exercise = Exercise.create(id: 10, name: "Demo", price: 1000, description: "demo demo")
  end

  describe "GET /index " do
    it "renders index template" do
      get exercises_path
      expect(response).to render_template("index")
    end
  end

  describe "GET /new " do
    it "initializes new Exercise object" do
      user = Exercise.new
      expect(user).to be_a_new(Exercise)
    end

    it "renders new template" do
      get new_exercise_path
      expect(response).to render_template("new")
    end
  end

  describe "POST /create" do
    it "creates new exercise" do
      post exercises_path, :params => {:exercise => {:name => "demo", :price => "1000", :description => "demo"} }
      expect(response).to redirect_to(exercises_path)
    end
  end

  describe "GET /edit" do
    it "renders edit template" do
      get edit_exercise_path(@exercise.id)
      expect(response).to render_template("edit")
    end
  end

  describe "POST /update" do
    it "updates existing exercise" do
      put exercise_path(@exercise.id), :params => {:exercise => {:price => "2000"} }
      expect(response).to redirect_to(exercises_path)
    end
  end

  describe "DELETE destroy" do
    it "should set the flash" do
      delete exercise_path(@exercise.id)
      expect(response).to redirect_to(exercises_path)
    end
  end
end

