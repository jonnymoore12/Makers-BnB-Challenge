ENV['RACK_ENV'] ||= "development"

require 'sinatra/base'
require_relative 'datamapper_setup'

class BnB < Sinatra::Base
  enable :sessions
  set :session_secret, 'super_secret'

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/' do
    erb :index
  end

  post '/users' do
    user = User.create(email: params[:email],
                password: params[:password],
                password_confirmation: params[:password_confirmation])
    session[:user_id] = user.id
    redirect '/'
  end

  get '/sessions/new' do
    erb :login
  end

  post '/sessions' do
    session[:user_id] = user.id
    redirect '/spaces'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
