require "spec_helper"

RSpec.describe RecipesController, type: :controller do
  def app
    RecipesController
  end
  context "GET #index" do
    it "returns a success response" do
      get "/"
      expect(last_response.status).to eq(200)
    end
  end

  # context "all recipes" do
  #   let(:response) { get "/" }
  #   it "displays all recipes" do
  #     expect(response.body).to eq(Recipe.all)
  #   end
  # end
end
