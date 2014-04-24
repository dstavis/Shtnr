get '/users' do
  #get a list of all users
end

post '/users' do
  #create a new user
  user = User.create(params)
  session[:user_id] = user.id
  redirect "/users/#{user.id}"
end

get '/users/:id' do
  @id = params[:id].to_i
  erb :profile_page
end

put '/users/:id' do
  #update a specific user
end