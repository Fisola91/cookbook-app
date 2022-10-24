require "spec_helper"

RSpec.describe Recipe, type: :model do
  context "validation test" do
    let(:recipe) { build(:random_recipe)}
    it "should save successfully" do
      # recipe = Recipe.new(name: "Tomato", description: "rice, tomat", completed: "nil").save
      expect(recipe.save).to eq(true)
    end

    it "ensures the presence of recipe name" do
      # recipe = Recipe.new(description: "rice, tomat", completed: "nil").save
      recipe.name = nil
      expect(recipe.save).to eq(false)
    end

    it "ensures the presence of recipe description" do
      # recipe = Recipe.new(name: "Tomato", completed: "nil").save
      recipe.description = nil
      expect(recipe.save).to eq(false)
    end

    it "ensures the presence of completed recipe" do
      # recipe = Recipe.new(name: "Tomato", description: "rice, tomat").save
      recipe.completed = true
      expect(recipe.save).to eq(false)
    end

  end


  # it "is boolean" do
  #   expect(subject).to validate_inclusion_of(:completed).in_array([true, false, nil])
  # end
end
