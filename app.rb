ENV['RACK_ENV'] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'datamapper_setup'
if ENV['RACK_ENV'] == 'test'
  require 'pry'
end

class BnB < Sinatra::Base
  enable :sessions
  set :session_secret, 'super_secret'
  use Rack::MethodOverride

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
    @spaces = Space.all

    erb :'spaces/index'
  end

  get '/spaces/new' do
    erb :'spaces/new'
  end

  post '/spaces' do
    space = Space.new(name: params[:name],
                        description: params[:description],
                        price: params[:price],
                        available_from: params[:available_from],
                        available_to: params[:available_to],)
    space.user_id = current_user.id

    if space.save
      flash[:notice] = "Your space was successfully listed"
      redirect '/spaces'
    else
      flash.now[:error] = space.errors.full_messages
      erb :'spaces/new'
    end
  end

  get '/spaces/:id' do
    @space = Space.get(params[:id])
    erb :'spaces/view'
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
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect '/spaces'
    else
      flash.now[:error] = ['Password or email was incorrect']
      erb :login
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:logout] = 'Goodbye!'
    redirect '/'
  end

  post '/requests' do
    request = Request.new(date: params[:start_date],
                          status: "pending")
    if request.save
      flash.now[:notice] = ["Thanks, your booking request will be processed soon!"]
      redirect '/requests'
    else
      flash.now[:error] = ["Please, pick a date!"]
      redirect '/spaces'
    end
  end

  get '/requests' do
    erb :requests
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
