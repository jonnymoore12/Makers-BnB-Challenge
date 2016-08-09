ENV['RACK_ENV'] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'datamapper_setup'

class BnB < Sinatra::Base
  enable :sessions
  set :session_secret, 'super_secret'

  register Sinatra::Flash

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/' do
    erb :index
  end

  get '/spaces' do
    erb :'spaces/index'
  end

  get '/spaces/new' do
    erb :'spaces/new'
  end

  post '/spaces' do
    space = Space.create(name: params[:name],
                        description: params[:description],
                        price: params[:price],
                        available_from: params[:availabe_from],
                        available_to: params[:available_to])
    redirect '/spaces'
  end

  post '/users' do
    user = User.new(email: params[:email],
                password: params[:password],
                password_confirmation: params[:password_confirmation])
    if user.save
      session[:user_id] = user.id
      flash[:notice] = "Welcome, #{user.email}"
      redirect '/spaces'
    else
      flash.now[:error] = user.errors.full_messages
      erb :index
    end
  end

  get '/sessions/new' do
    erb :login
  end

  post '/sessions' do
    user = User.first(email: params[:email])
    session[:user_id] = user.id
    redirect '/spaces'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
