require './config/environment'
require "sinatra/base"
require "sinatra/reloader"

class ApplicationController < Sinatra::Base
  configure :development do
    # use BetterErrors::Middleware
    # BetterErrors.application_root = File.expand_path(__dir__)
    register Sinatra::Reloader
  end

  set :public_folder, 'public'
  set :views, 'app/views/recipes'

    register Sinatra::Reloader
  end
  set :public_folder, 'public'
  set :views, 'app/views/recipes'
end
