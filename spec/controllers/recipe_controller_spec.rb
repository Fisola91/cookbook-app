require "spec_helper"

RSpec.describe RecipesController, type: :controller do
  def app
    RecipesController
  end

  context "GET #index" do
  describe "GET #index" do
    it "returns a success response" do
      get "/"
      expect(last_response.status).to eq(200)
    end

    # it "displays all recipes" do
    #   recipe = Recipe.all
    #   get "/"
    #   expect(last_response.body).to eq(recipe)
    # end

  end

end
