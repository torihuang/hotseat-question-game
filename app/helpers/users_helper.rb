helpers do
  def logged_in?
    !!session[:user_id]
  end

  def current_user
    return User.find_by(id: session[:user_id])
  end
end