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
    if current_user
      redirect '/spaces'
    else
      @user = User.new
      erb :index
    end
  end

end
