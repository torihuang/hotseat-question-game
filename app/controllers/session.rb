get '/login' do
  if request.xhr?
    status 200
    erb :'session/login', layout: false
  end
end

get '/logout' do
  session[:user_id] = nil
end

post '/session' do
  username = params[:username]
  password_input = params[:password]
  user = User.authenticate(username, password_input)
  return_hash = {}
  if user
    session[:user_id] = user.id
    return_hash[:logged_in] = true
  else
    @errors = ["Please enter a valid username and password"]
    return_hash[:logged_in] = false
    return_hash[:erb_value] = erb :error, layout: false
  end

  if request.xhr?
    content_type :json
    return_hash.to_json
  end
end