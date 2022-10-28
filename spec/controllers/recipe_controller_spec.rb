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
end
