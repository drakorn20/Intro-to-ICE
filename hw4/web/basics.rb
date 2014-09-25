require 'sinatra'

get '/' do
	"Hello World!"
end

get '/about' do
	"There is something about me"
end

get '/hello/:name' do
	name_from_url = params[:name]
	"Hello, how are you, #{name_from_url.capitalize}?"
end

get '/form' do
	erb :form
end

post '/form' do
	name = params[:message]
	"Hey !!! #{name}"
end