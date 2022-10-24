class RecipesController < ApplicationController

  get "/" do
    @recipes = Recipe.all
    erb :index
  end

  get "/new" do
    erb :new
  end

  post "/recipes" do
    @recipe = Recipe.new(name: params[:name], description: params[:description])
    @recipe.save
    binding.pry
    redirect ("/recipes/#{@recipe.id}")
  end

  get "/recipes/:id" do

    @recipe = Recipe.find_by(id: params[:id])
    erb :show
  end

  get "/recipes/:id/edit" do
    @recipe = Recipe.find_by(id: params[:id])
    erb :edit
  end

  patch "/recipes/:id" do
    @recipe = Recipe.find_by(id: params[:id])
    @recipe.update(name: params[:name], description: params[:description])
    redirect ("/recipes/#{@recipe.id}")
  end

  delete "/recipes/:id" do
    @recipe = Recipe.find_by(id: params[:id])
    @recipe.destroy
    redirect "/"
  end
end
