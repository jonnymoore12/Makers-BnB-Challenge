class BnB < Sinatra::Base

  register Sinatra::Flash
  register Sinatra::Partial

  enable :sessions
  set :session_secret, 'super_secret'
  set :partial_template_engine, :erb
  enable :partial_underscores
  use Rack::MethodOverride


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
