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


end
