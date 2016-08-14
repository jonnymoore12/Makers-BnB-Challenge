class BnB < Sinatra::Base

  post '/requests' do
    @space = Space.get(params[:space_id])
    @approved_request = Request.all(date: params[:start_date],
                                    space: @space,
                                    status: "approved")

    request = Request.new(date: params[:start_date],
                          status: "pending",
                          guest_id: current_user.id,
                          host_id: @space.host.id,
                          space_id: @space.id)
    if !@space.is_available?(request.date.to_s)
      flash.now[:error] = ["Space is not available for this day",
                           "Please, pick a date!"]
      erb :'spaces/view'
    elsif !@approved_request.empty?
      flash.now[:error] = ["This date is already booked"]
      erb :'spaces/view'
    elsif request.save
      flash[:notice] = "Thanks, your booking request is pending!"
      redirect '/spaces'
    else
      flash[:error] = request.errors.full_messages
      erb :'spaces/view'
    end
  end

  get '/requests' do
    if current_user
      @received_requests = current_user.requests_received
      @sent_requests = current_user.requests_sent
      erb :'requests/index'
    else
      flash[:error] = ["Please sign up or log in to view requests"]
      redirect '/'
    end
  end

  get '/requests/:id' do
    @individual_request = Request.get(params[:id])
    erb :'requests/view'
  end

  post '/requests/approve/:id' do
    @approve_request = Request.get(params[:id])
    @approve_request.status = "approved"
    @approve_request.save
    other_requests = Request.all(date: @approve_request.date,
                                 space: @approve_request.space,
                                 status: "pending")
    other_requests.each do |req|
      req.status = "denied"
      req.save
    end
    redirect '/requests'
  end

  post '/requests/deny/:id' do
    @deny_request = Request.get(params[:id])
    @deny_request.status = "denied"
    @deny_request.save
    redirect '/requests'
  end

end
