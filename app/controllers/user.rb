get '/users/new' do
  if request.xhr?
    status 200
    erb :'users/new', layout: false
  end
end

post '/users' do
  user = User.new(params)

  return_hash = {}
  if user.save
    session[:user_id] = user.id
    return_hash[:logged_in] = true
  else
    @errors = user.errors.full_messages
    return_hash[:logged_in] = false
    return_hash[:erb_value] = erb :error, layout: false
  end

  if request.xhr?
    content_type :json
    return_hash.to_json
  end
end