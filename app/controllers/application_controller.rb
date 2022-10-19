require './config/environment'
require "sinatra/base"
require "sinatra/reloader"

class ApplicationController < Sinatra::Base
  configure :development do
    # use BetterErrors::Middleware
    # BetterErrors.application_root = File.expand_path(__dir__)
    set :public_folder, 'public'
    set :views, 'app/views'
    register Sinatra::Reloader
  end
  # before do

  # end

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
  # end
end
