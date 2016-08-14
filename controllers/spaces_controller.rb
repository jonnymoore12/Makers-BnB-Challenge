class BnB < Sinatra::Base

  get '/spaces' do
    @spaces = Space.all
    erb :'spaces/index'
  end

  get '/spaces/new' do
    @space = Space.new
    erb :'spaces/new'
  end

  post '/spaces' do
    @space = Space.new(name: params[:name],
                        description: params[:description],
                        price: params[:price],
                        available_from: params[:available_from],
                        available_to: params[:available_to],)
    @space.host_id = current_user.id

    if @space.save
      flash[:notice] = "Your space was successfully listed"
      redirect '/spaces'
    else
      flash.now[:error] = @space.errors.full_messages
      erb :'spaces/new'
    end
  end

  get '/spaces/:id' do
    @space = Space.get(params[:id])
    erb :'spaces/view'
  end

end
