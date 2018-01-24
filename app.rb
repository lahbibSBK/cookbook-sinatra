require_relative 'view'
require_relative 'recipe'
require_relative 'cookbook'
require_relative 'parsing'
require "sinatra"
require "sinatra/reloader" if development?
require "pry-byebug"
require "better_errors"

configure :development do
  use BetterErrors::Middleware
  BetterErrors.application_root = File.expand_path('..', __FILE__)
end

get '/' do
  'Hello world!'

end
