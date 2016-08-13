class BnB < Sinatra::Base

  post '/users' do
    @user = User.new(email: params[:email],
                password: params[:password],
                password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Welcome, #{@user.email}"
      redirect '/spaces'
    else
      flash.now[:error] = @user.errors.full_messages
      erb :index
    end
  end

end
