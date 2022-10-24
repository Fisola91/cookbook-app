require "spec_helper"

RSpec.describe Recipe, type: :model do
  context "validation test" do
    it "should save successfully" do
      recipe = Recipe.new(name: "Tomato", description: "rice, tomat", completed: "nil").save
      expect(recipe).to eq(true)
    end

    it "ensures the presence of recipe name" do
      recipe = Recipe.new(description: "rice, tomat", completed: "nil").save
      expect(recipe).to eq(false)
    end

    it "ensures the presence of recipe description" do
      recipe = Recipe.new(name: "Tomato", completed: "nil").save
      expect(recipe).to eq(false)
    end

    it "ensures the presence of completed recipe" do
      recipe = Recipe.new(name: "Tomato", description: "rice, tomat").save
      expect(recipe).to eq(true)
    end

  end


  # it "is boolean" do
  #   expect(subject).to validate_inclusion_of(:completed).in_array([true, false, nil])
  # end
end
