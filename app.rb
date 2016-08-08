require 'sinatra/base'

class BnB < Sinatra::Base
  enable :sessions
  set :session_secret, 'super_secret'

  get '/' do
    erb :index
  end

  post '/users' do
    session[:email] = params[:email]
    redirect '/'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
