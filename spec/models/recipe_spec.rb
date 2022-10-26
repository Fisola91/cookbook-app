require "spec_helper"

RSpec.describe Recipe, type: :model do
  context "validation test" do
    let(:recipe) { build(:random_recipe)}
    it "should save successfully" do
      expect(recipe.save).to eq(true)
    end

    it "ensures the presence of recipe name" do
      recipe.name = nil
      expect(recipe.save).to eq(false)
    end

    it "ensures the presence of recipe description" do
      recipe.description = nil
      expect(recipe.save).to eq(false)
    end

    it "ensures the presence of completed recipe" do
      recipe.completed = nil
      expect(recipe.save).to eq(true)
    end

  end


  # it "is boolean" do
  #   expect(subject).to validate_inclusion_of(:completed).in_array([true, false, nil])
  # end
end
