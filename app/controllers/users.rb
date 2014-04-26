get '/users' do
	@users = User.all
  erb :users
end

post '/users' do
  user = User.create(params)
  session[:user_id] = user.id
  redirect "/users/#{user.id}"
end

get '/users/:id' do
  @id = params[:id].to_i
  erb :profile_page
end