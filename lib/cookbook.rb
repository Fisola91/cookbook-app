require "csv"

require_relative "recipe"

class Cookbook

  def initialize(csv_file)
    @csv_file = csv_file
    @recipes = []
    load_csv if File.exist?(@csv_file)
  end

  def all
    @recipes
  end

  def add_recipe(recipe)
    @recipes << recipe
    save
  end

  def find(recipe_index)
    @recipes[recipe_index]
  end

  def mark_recipe_as_done(recipe_index)
    recipe = @recipes[recipe_index]
    recipe.mark_as_done!
    save
  end

  def delete(recipe)
    @recipes.delete(recipe)
    save
  end

  private

  def load_csv
    CSV.foreach(@csv_file, headers: :first_row, header_converters: :symbol) do |row|
      # It has heading so need for name: rrow[:name]
      @recipes << Recipe.new(row[0], row[1])
    end
  end

  def save
    CSV.open(@csv_file, "wb") do |csv|
      csv << ["name", "description"]
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description]
      end
    end
  end
end
