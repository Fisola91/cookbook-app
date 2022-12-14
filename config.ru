require_relative './config/environment.rb'

if ActiveRecord::Base.connection.migration_context.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use Rack::MethodOverride
use RecipesController


# use OtherController
run ApplicationController

# run App
