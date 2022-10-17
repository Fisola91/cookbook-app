# require "sinatra/base"
# require "sinatra/reloader" if development?
# require "pry-byebug"
# require 'sinatra/contrib'
# require "better_errors"
# require "sinatra/activerecord"
# require_relative "./controllers/app/cookbook"

class ApplicationController < Sinatra::Base
  configure :development do
    # use BetterErrors::Middleware
    # BetterErrors.application_root = File.expand_path(__dir__)
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  # before do

  # end

  get "/" do
    cookbook = Cookbook.new(File.join(__dir__, "recipes.csv"))
    @recipes = cookbook.all
    erb :index
  end
  get "/new" do
    erb :new
  end

  post "/recipes" do
    cookbook = Cookbook.new(File.join(__dir__, "recipes.csv"))
    recipe = Recipe.new(id: params[:id], name: params[:name], description: params[:description])
    recipes = cookbook.add_recipe(@recipe)
    binding.pry
    # recipe = cookbook.find_by_name(params[:name])
    redirect to("recipes/#{recipe}")
  end


  get "recipes/:id" do
    cookbook = Cookbook.new(File.join(__dir__, "recipes.csv"))
    @recipe = cookbook.find(params[:id].to_i)
    erb :show
  end

  get "/recipes/:index" do
    cookbook = Cookbook.new(File.join(__dir__, "recipes.csv"))
    recipe = cookbook.find(params[:i].to_i)
    cookbook.delete(recipe)
    redirect to("/")
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
