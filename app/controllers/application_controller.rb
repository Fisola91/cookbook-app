require './config/environment'
require "sinatra/base"
require "sinatra/reloader"

class ApplicationController < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  set :public_folder, 'public'
  set :views, 'app/views/recipes'
end
