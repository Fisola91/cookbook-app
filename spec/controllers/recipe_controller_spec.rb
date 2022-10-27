require "spec_helper"

RSpec.describe RecipesController, type: :controller do
  def app
    RecipesController
  end

  describe "GET #index" do
    it "returns a success response" do
      get "/"
      expect(last_response.status).to eq(200)
    end
  end

  describe "all recipes" do
    let(:recipe) { build(:random_recipe)}
    it "displays all recipes" do
      subject { get "/" }
      expect(assigns(subject)).to eq([recipe])
    end
  end

  describe "GET new" do
    it "renders :new template" do
      get "/new"
      expect(last_response.body).to render_template(:new)
    end
  end
end
