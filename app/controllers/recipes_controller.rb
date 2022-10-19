class RecipesController < ApplicationController

  get "/" do
    @recipes = Recipe.all
    erb :index
  end

  get "/new" do
    recipe = Recipe.new
    erb :new
  end

  post "/recipes" do
    recipe = Recipe.new(name: params[:name], description: params[:description])
    recipe.save
    # binding.pry
    redirect ("recipes/#{recipe.id}")
  end

  get "/recipes/:id" do
    @recipe = Recipe.find_by(id: params[:id])
    erb :show
  end

  delete "/recipes/:id" do
    recipe = Recipe.find(params[:id])
    recipe.destroy
    redirect "/"
  end

  # get

  # get "recipes/:index/edit" do
  #   cookbook = Cookbook.new(File.join(__dir__, "recipes.csv"))
  #   recipe = cookbook.find(params[:index].to_i)
  # end


  # get "/recipes/:index" do
  #   cookbook = Cookbook.new(File.join(__dir__, "recipes.csv"))
  #   recipe = cookbook.mark_recipe_as_done(params[:index].to_i)
  #   redirect to("/")
  # end



  # get "/team/:username" do
  #   # binding.pry
  #   puts params[:username]
  #   "The username is #{params[:username]}"
  # en

end
