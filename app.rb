ENV['RACK_ENV'] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'
require_relative 'datamapper_setup'
if ENV['RACK_ENV'] == 'test'
  require 'pry'
end

require_relative 'server.rb'
require_relative 'controllers/users_controller'
require_relative 'controllers/sessions_controller'
require_relative 'controllers/spaces_controller'
require_relative 'controllers/requests_controller'
