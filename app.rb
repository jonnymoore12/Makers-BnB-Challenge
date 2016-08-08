require 'sinatra/base'

class BnB < Sinatra::Base
  get '/' do
    'Hello BnB!'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
