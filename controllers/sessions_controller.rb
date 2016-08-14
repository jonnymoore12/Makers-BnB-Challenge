class BnB < Sinatra::Base

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

end
