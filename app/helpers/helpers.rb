helpers do
  def logged_in?
    !!session[:user_id]
  end

  def current_user
    if session[:user_id]
      User.find(session[:user_id])
    end
  end
end