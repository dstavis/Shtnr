require 'securerandom'

get '/' do
  # Look in app/views/index.erb
  @urls = Url.all
  erb :index
end

post '/urls' do
  url = Url.new(params)
  url.short = SecureRandom.urlsafe_base64(4)
  url.save
  redirect '/'
end

get '/:short_url' do
  #shtnr/dt4h
  url = Url.find_by_short(params[:short_url])
  url.click_count+=1
  url.save
  redirect(url.original)
end