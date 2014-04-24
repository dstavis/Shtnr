post '/login' do
  #log in the user IF the credentials they provided match those in the database

  user = User.find_by_email(params[:email])

  if user && user.password == params[:password]
    session[:user_id] = user.id
    redirect "/users/#{user.id}"
  end
  redirect '/'
end

post '/logout' do
  session[:user_id] = nil
  redirect '/'
end