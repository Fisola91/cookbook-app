require "sinatra"
require "sinatra/reloader" if development?
require "pry-byebug"
require "better_errors"
require_relative "lib/cookbook"

configure :development do
  use BetterErrors::Middleware
  BetterErrors.application_root = File.expand_path(__dir__)
end

get "/" do
  cookbook = Cookbook.new("recipe.csv")
  @view = cookbook.all
  erb :index
end
get "/new" do
  erb :new
end


get "/about" do
  slim :about
end

get "/team/:username" do
  # binding.pry
  puts params[:username]
  "The username is #{params[:username]}"
end
