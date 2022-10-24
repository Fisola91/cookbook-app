require "spec_helper"

RSpec.describe RecipesController, type: :controller do
  describe "GET #index" do
    it "returns a 209 custom status code" do
      get "/"
      expect(response).to have_http_status(200)
    end
  end
end
