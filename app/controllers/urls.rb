get '/' do
  # Look in app/views/index.erb
  @urls = Url.all
  erb :index
end

post '/urls' do
  url = Url.new(params)
  url.user = User.find(session[:user_id]) if logged_in?
  url.save

  if logged_in?
    redirect "users/#{current_user.id}"
  else
    redirect '/'
  end
end

get '/:short_url' do
  url = Url.find_by_short(params[:short_url])
  
  if url
    url.click
    redirect(url.original)
  else
    if logged_in?
      redirect "users/#{current_user.id}?message='No such url'"
    else
      redirect "/?message='No such url'"
    end
  end
end

